from django.db import models

# Create your models here.
class RoleDetails(models.Model):
    name = models.CharField(max_length=225, default="")
    email = models.CharField(max_length=225, primary_key=True)
    password = models.CharField(max_length=225, default="")
    mobile = models.CharField(max_length=225, default="")
    image = models.CharField(max_length=225, default="", null=True)
    gender = models.CharField(max_length=225, default="",null=True)
    address = models.CharField(max_length=225, default="",null=True)
    otp = models.CharField(max_length=225, default="",null=True)
    active = models.CharField(max_length=225,default="")
    verify_link = models.CharField(max_length=225,default="",null=True)
    auth_token = models.CharField(max_length=225,default="",null=True)

