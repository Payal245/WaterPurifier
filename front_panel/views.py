from django.shortcuts import render, HttpResponse, redirect
from front_panel.foms import RoleDetailsForm
from front_panel.models import RoleDetails
from backend_panel.models import PurifierBrands, ServiceCharges
from miscFiles.genericFunction import generate_string,link_send,otp_generate,otp_send
from django.contrib.auth.hashers import make_password,check_password
from django.core.files.storage import FileSystemStorage

# Create your views here.
def index(request):
    data = PurifierBrands.objects.all()
    s_data = ServiceCharges.objects.all()
    return render(request,"index.html",{'data':data,'s_data':s_data})

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
    return render(request,"admin_index.html")

def logout(request):
    request.session['email'] = ""
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
            return render(request,"user_search.html",{'data':data})
        except:
            return redirect("/admin_index/")