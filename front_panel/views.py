from django.shortcuts import render, HttpResponse, redirect
from front_panel.foms import RoleDetailsForm
from front_panel.models import RoleDetails
from backend_panel.models import PurifierBrands, ServiceCharges , Modals ,Aquagaurd_parts,TopBrands, Descriptions,Features
from miscFiles.genericFunction import generate_string,link_send,otp_generate,otp_send
from django.contrib.auth.hashers import make_password,check_password
from django.core.files.storage import FileSystemStorage

# Create your views here.
def index(request):
    data = PurifierBrands.objects.all()
    slide = Modals.objects.filter(brand_id=5)
    smith = Modals.objects.filter(brand_id=4)
    kent = Modals.objects.filter(brand_id=7)
    blue =Modals.objects.filter(brand_id = 6)
    livepure = Modals.objects.filter(brand_id=9)
    bd_data=[]
    c=0
    for i in data:
        if c==5:
            break
        bd_data.append(i)
        c += 1
    s=len(smith)

    s_data = ServiceCharges.objects.all()
    top_data = TopBrands.objects.all()
    return render(request,"index.html",{'data':data,'blue':blue,'bd_data':bd_data,'s_data':s_data,'top_data':top_data, 'slide':slide,'kent':kent,'livepure':livepure,'smith':smith})

def registration(request):
    if request.method == "POST":
        form =RoleDetailsForm(request.POST)
        f = form.save(commit=False)
        f.name = request.POST['name']
        f.email = request.POST['email']
        f.mobile = request.POST['mobile']
        f.address = request.POST['address']
        f.active = 0
        string = generate_string()
        link = make_password(string)
        link = link.replace("+","")
        f.verify_link = link
        f.save()
        request.session['email'] = f.email
        f_link = "127.0.0.1:8000/verify_link/?link="+link
        link_send(f.email, f_link)
        return render(request, "index.html",{'confirm' :True})
    return render(request,"index.html")


def login(request):
    if request.method == "POST":
        get_email= request.POST['email']
        get_password = request.POST['password']
        data = RoleDetails.objects.get(email=get_email)
        user_password=data.password
        if check_password(get_password, user_password):
            request.session['email'] = data.email
            request.session['name'] = data.name
            if data.email == "pg7298441495@gmail.com":
                return redirect("/admin_index/")
            else:
                return HttpResponse("Welcome User")
    return render(request,"index.html")


def verify_link(request):
    get_link =request.GET['link']
    session_mail = request.session['email']
    data = RoleDetails.objects.get(email=session_mail)
    db_verify = data.verify_link
    if get_link == db_verify:
        return redirect("/update_password/")

def update_password(request):
    if request.method == "POST":
        user_password = request.POST['new_pass']
        con_password = request.POST['con_pass']
        session_mail = request.session['email']
        data = RoleDetails.objects.get(email=session_mail)
        if user_password == con_password:
            update = RoleDetails(email=session_mail, active=1, verify_link="", password=make_password(con_password))
            update.save(update_fields=['active', 'verify_link', 'password'])
            request.session['email'] = ""
            return redirect("/home/")
        else:
            return HttpResponse("Please enter same password ")
    return render(request,"updatePassword.html")

def forgot_password(request):
    if request.method == "POST":
        get_email = request.POST["text"]
        get_password = request.POST["n_pass"]
        get_cpass = request.POST['c_pass']
        if get_email!="" and get_password == "" and get_cpass =="":
            try:
                data = RoleDetails.objects.get(email=get_email)
                otp = otp_generate()
                update = RoleDetails(email=get_email, otp=otp)
                update.save(update_fields=['otp'])
                otp_send(str(otp), get_email)
                request.session['email'] = get_email
                return render(request,"forgottenPasword.html", {'otp': True})
            except:
                return HttpResponse("Email not valid")
        elif get_email!="" and get_password != "" and get_cpass !="":
            data = RoleDetails.objects.get(email=request.session['email'])
            db_otp = data.otp
            if get_email == db_otp:
                if get_password == get_cpass:
                    update = RoleDetails(email=request.session['email'], otp="", password=make_password(get_cpass))
                    update.save(update_fields=['otp', 'password'])
                    request.session['email'] = ""
                    return redirect("/")
            return render(request,"forgottenPasword.html",{'confirm':True})
    return render(request,"forgottenPasword.html")

def admin_index(request):
    data= RoleDetails.objects.all()
    b_data= PurifierBrands.objects.all()
    t_data = ServiceCharges.objects.all()
    m_data = Modals.objects.all()
    p_data = Aquagaurd_parts.objects.all()
    user_count = 0
    brand_data = 0
    model_data = 0
    service_data = 0
    for i in data:
        user_count += 1
    for j in b_data:
        brand_data += 1
    for k in m_data:
        model_data += 1
    for l in t_data:
        service_data += 1
    return render(request,"admin_index.html",{'data': data,'m_data':m_data, 'p_data':p_data,'b_data':b_data,'user_count': user_count,'brand_data':brand_data,'model_data':model_data,'service_data':service_data})

def logout(request):
    request.session['email'] = ""
    request.session['name'] = ""
    return redirect("/")

def admin_update_profile(request):
    if request.method =='POST':
        get_email = request.session['email']
        user_image = None
        try:
            if request.FILES["image"]:
                my_file = request.FILES["image"]
                fs = FileSystemStorage()
                file_name = fs.save(my_file.name, my_file)
                user_image = fs.url(file_name)
                user_image = my_file.name
        except:
            pass
        get_name = request.POST['Ad_name']
        get_mobile = request.POST['mobile']
        get_address = request.POST['address']
        update = RoleDetails(email=get_email, name=get_name, mobile=get_mobile, address=get_address, image=user_image)
        update.save(update_fields=['name','mobile','address','image'])
        request.session['image'] = user_image
        return redirect("/admin_index/")
    return render(request, "update_admin_profile.html")

def admin_update_password(request):
    if request.method == "POST":
        get_email = request.session['email']
        data = RoleDetails.objects.get(email=get_email)
        user_password = request.POST['old_pass']
        n_pass = request.POST['n_pass']
        c_pass = request.POST['c_pass']
        db_pass = data.password
        if check_password(user_password,db_pass):
            if n_pass==c_pass:
                update = RoleDetails(email=get_email,password=make_password(c_pass))
                update.save(update_fields=['password'])
                return redirect("/admin_index/")
            else:
                return HttpResponse("please enter same password")
        else:
            return HttpResponse("please enter correct password")
    return render(request,"update_admin_password.html")

def user_search(request):
    if request.method == "POST":
        get_email = request.POST['email']
        try:
            data = RoleDetails.objects.get(email=get_email)
            return render(request, "user_search.html", {'data':data})
        except:
            return redirect("/admin_index/")

def about(request):
    data = PurifierBrands.objects.all()
    bd_data = []
    c = 0
    for i in data:
        if c == 5:
            break
        bd_data.append(i)
        c += 1
    return render(request,"about.html",{'data':data,'bd_data':bd_data})

def modal_search(request):
    if request.method == "POST":
        get_name = request.POST['search']
        b_data = PurifierBrands.objects.filter(brands=get_name)
        model_data = Modals.objects.filter(name=get_name)
        if len(b_data)!=0:
           for i in b_data:
               get_id = i.id
           data = PurifierBrands.objects.all()
           brands_data = PurifierBrands.objects.get(id=get_id)
           model_data = Modals.objects.filter(brand_id=get_id)
           return render(request, "brands_detail.html",{'data': data, 'brands_data': brands_data, 'model_data': model_data})
        elif len(model_data)!=0:
            for i in model_data:
                get_id = i.id
            data = PurifierBrands.objects.all()
            m_data = Modals.objects.get(id=get_id)
            d_data = Descriptions.objects.filter(modal_id=get_id)
            f_data = Features.objects.filter(modal_id=get_id)
            return render(request, "modal_detail.html",{'data': data, 'm_data': m_data, 'd_data': d_data, 'f_data': f_data})
        else:
            return HttpResponse("OOPs! Data not found")


