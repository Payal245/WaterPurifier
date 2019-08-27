from django.db import models

# Create your models here.
class PurifierBrands(models.Model):
    id = models.AutoField(primary_key=True)
    brands = models.CharField(max_length=225,null=True,unique=True)

class TopBrands(models.Model):
    id  =models.AutoField(primary_key=True)
    brand = models.ForeignKey(PurifierBrands, on_delete=models.CASCADE)
    image = models.CharField(max_length=225,default="",null=True)


class Modals(models.Model):
    id = models.AutoField(primary_key=True)
    brand = models.ForeignKey(PurifierBrands, on_delete=models.CASCADE)
    name = models.CharField(max_length=225,default="",null=True,unique=True)
    image = models.CharField(max_length=225,default="",null=True)
    price = models.CharField(max_length=225,default="",null=True)

class Descriptions(models.Model):
    id = models.AutoField(primary_key=True)
    description = models.CharField(max_length=225,default="",null=True)
    modal =  models.ForeignKey(Modals, on_delete=models.CASCADE)

class Features(models.Model):
    id = models.AutoField(primary_key=True)
    features = models.CharField(max_length=225,default="",null=True)
    modal =  models.ForeignKey(Modals, on_delete=models.CASCADE)

class ServiceCharges(models.Model):
    id = models.AutoField(primary_key=True)
    service = models.CharField(max_length=225,null=True,unique=True)
    price = models.CharField(max_length=225, default="", null=True)

class Aquagaurd_parts(models.Model):
    id  = models.AutoField(primary_key=True)
    company = models.ForeignKey(PurifierBrands, on_delete=models.CASCADE)
    name = models.CharField(max_length=225,default="", null=True,unique=True)
    quality = models.CharField(max_length=225,default="",null=True)
    image = models.CharField(max_length=225, default="", null=True)
    price = models.CharField(max_length=225,default="",null=True)
    Desc = models.CharField(max_length=225,default="",null=True)