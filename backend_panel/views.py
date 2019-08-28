from django.shortcuts import render,HttpResponse, redirect
from backend_panel.forms import PurifierBrandsForm, ModalsForm, DescriptionsForm, FeaturesForm, ServiceChargesForm, Aquagaurd_partsForm,TopBrandsForm
from backend_panel.models import PurifierBrands, Modals, Descriptions, Features, ServiceCharges, Aquagaurd_parts,TopBrands
from django.core.files.storage import FileSystemStorage

# Create your views here.

def brands(request):
    if request.method == "POST":
        form = PurifierBrandsForm(request.POST)
        f = form.save(commit=False)
        f.brands = request.POST['brand']
        f.save()
    return render(request,"PurifierBrands.html")

def modal_details(request):
    data = PurifierBrands.objects.all()
    if request.method == "POST":
        form = ModalsForm(request.POST)
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
        f = form.save(commit=False)
        f.brand_id = request.POST['brand']
        f.name = request.POST['name']
        f.image = user_image
        f.price = request.POST['price']
        f.save()
    return render(request,"purifier_modals.html",{'data':data})

def top_brand(request):
    data = PurifierBrands.objects.all()
    if request.method == "POST":
        form = TopBrandsForm(request.POST)
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
        f = form.save(commit=False)
        f.brand_id = request.POST['brand']
        f.image = user_image
        f.save()
    return render(request,"top_brand.html",{'data':data})

def description(request):
    data = Modals.objects.all()
    if request.method == "POST":
        form = DescriptionsForm(request.POST)
        f = form.save(commit=False)
        f.modal_id = request.POST['name']
        f.description = request.POST['description']
        f.save()
    return render(request,"description.html",{'data':data})

def features(request):
    data = Modals.objects.all()
    if request.method == "POST":
        form = FeaturesForm(request.POST)
        f = form.save(commit=False)
        f.modal_id = request.POST['name']
        f.features = request.POST['features']
        f.save()
    return render(request,"features.html",{'data':data})

def update_brands(request):
    data = PurifierBrands.objects.all()
    return render(request,"update_brands.html", {'data': data})

def update_top_brands(request):
    data = TopBrands.objects.all()
    return render(request,"update_top_brand.html", {'data': data})

def update_models(request):
    data = Modals.objects.all()
    return render(request,"update_models.html",{'data':data})

def update_description(request):
    data = Descriptions.objects.all()
    return render(request,"update_description.html",{'data':data})

def update_features(request):
    data = Features.objects.all()
    return render(request,"update_features.html",{'data':data})

def edit_brands(request):
    get_id = request.GET['id']
    if request.method == "POST":
        name = request.POST['brand']
        update = PurifierBrands(id=get_id, brands=name)
        update.save(update_fields=['brands'])
    return render(request, "PurifierBrands.html")

def del_brands(request):
    get_id = request.GET['id']
    data = PurifierBrands.objects.get(id=get_id)
    data.delete()
    return redirect("/update_brands/")

def edit_models(request):
    get_id = request.GET['id']
    data = PurifierBrands.objects.all()
    if request.method == "POST":
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
        brand = request.POST['brand']
        name = request.POST['name']
        image = user_image
        price = request.POST['price']
        update = Modals(id=get_id, brand_id=brand ,name=name,image=image,price=price)
        update.save(update_fields=['brand_id','name','image','price'])
    return render(request, "purifier_modals.html",{'data':data})

def edit_top_brand(request):
    get_id = request.GET['id']
    data = PurifierBrands.objects.all()
    if request.method == "POST":
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
        brand = request.POST['brand']
        image = user_image
        update = TopBrands(id=get_id, brand_id=brand ,image=image)
        update.save(update_fields=['brand_id','image'])
    return render(request, "top_brand.html",{'data':data})


def delete_modals(request):
    get_id = request.GET['id']
    data = Modals.objects.get(id=get_id)
    data.delete()
    return redirect("/update_models/")

def delete_top_brand(request):
    get_id = request.GET['id']
    data = TopBrands.objects.get(id=get_id)
    data.delete()
    return redirect("/update_top_brand/")

def edit_description(request):
    get_id = request.GET['id']
    data = Modals.objects.all()
    if request.method == "POST":
        name = request.POST['name']
        description = request.POST['description']
        update = Descriptions(id=get_id, modal_id=name, description=description)
        update.save(update_fields=['modal_id', 'description'])
    return render(request, "description.html",{'data':data})

def delete_description(request):
    get_id = request.GET['id']
    data = Descriptions.objects.get(id=get_id)
    data.delete()
    return redirect("/update_description/")


def edit_features(request):
    get_id = request.GET['id']
    data = Modals.objects.all()
    if request.method == "POST":
        name = request.POST['name']
        features = request.POST['features']
        update = Features(id=get_id, modal_id=name, features=features)
        update.save(update_fields=['modal_id', 'features'])
    return render(request, "features.html",{'data':data})

def delete_features(request):
    get_id = request.GET['id']
    data = Features.objects.get(id=get_id)
    data.delete()
    return redirect("/update_features/")

def service(request):
    if request.method == "POST":
        form = ServiceChargesForm(request.POST)
        f = form.save(commit=False)
        f.service = request.POST['service']
        f.price = request.POST['price']
        f.save()
    return render(request,"service.html")

def update_service(request):
    data = ServiceCharges.objects.all()
    return render(request,"update_service.html",{'data':data})

def edit_service(request):
    get_id = request.GET['id']
    if request.method == "POST":
        name = request.POST['service']
        price = request.POST['price']
        update = ServiceCharges(id=get_id, service=name, price=price)
        update.save(update_fields=['service','price'])
    return render(request, "service.html")

def del_service(request):
    get_id = request.GET['id']
    data = ServiceCharges.objects.get(id=get_id)
    data.delete()
    return redirect("/update_service/")

def gallery(request):
    data = Modals.objects.all()
    return render(request,"gallery.html",{'data':data})

def brands_detail(request):
    data = PurifierBrands.objects.all()
    get_id = request.GET['id']
    brands_data = PurifierBrands.objects.get(id=get_id)
    model_data = Modals.objects.filter(brand_id = get_id)
    return render(request,"brands_detail.html",{'data':data,'brands_data':brands_data,'model_data':model_data})

def service_details(request):
    data = PurifierBrands.objects.all()
    ser_data = ServiceCharges.objects.all()
    return render(request,"service_detail.html",{'data':data,'ser_data':ser_data})

def aquagaurd_parts(request):
    data = PurifierBrands.objects.all()
    if request.method == "POST":
        form = Aquagaurd_partsForm(request.POST)
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
        f = form.save(commit=False)
        f.company_id = request.POST['brand']
        f.name = request.POST['name']
        f.image = user_image
        f.price = request.POST['price']
        f.quality = request.POST['quality']
        f.Desc = request.POST['Desc']
        f.save()
    return render(request, "Aquagaurd_parts.html", {'data': data})

def update_aquagaurd_parts(request):
    data = Aquagaurd_parts.objects.all()
    return render(request,"update_parts.html",{'data':data})

def edit_parts(request):
    get_id = request.GET['id']
    data = PurifierBrands.objects.all()
    if request.method == "POST":
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
        brand = request.POST['brand']
        name = request.POST['name']
        image = user_image
        price = request.POST['price']
        quality = request.POST['quality']
        desc = request.POST['Desc']
        update = Aquagaurd_parts(id=get_id, company_id=brand ,name=name,image=image,price=price,quality=quality,Desc=desc)
        update.save(update_fields=['company_id','name','image','price','quality','Desc'])
    return render(request, "Aquagaurd_parts.html",{'data':data})

def delete_parts(request):
    get_id = request.GET['id']
    data = Aquagaurd_parts.objects.get(id=get_id)
    data.delete()
    return redirect("/update_parts/")


def model_detail(request):
    data= PurifierBrands.objects.all()
    get_id = request.GET['id']
    m_data = Modals.objects.get(id=get_id)
    d_data = Descriptions.objects.filter(modal_id = get_id)
    f_data=Features.objects.filter(modal_id = get_id)
    return render(request,"modal_detail.html",{'data':data,'m_data':m_data,'d_data':d_data,'f_data':f_data})

def purifier_parts(request):
    data=PurifierBrands.objects.all()
    parts_data = Aquagaurd_parts.objects.all()
    return render(request,"purifier_parts.html",{'data':data,'parts_data':parts_data})





