from django import forms
from backend_panel.models import PurifierBrands, Modals, Descriptions, Features, ServiceCharges

class PurifierBrandsForm(forms.ModelForm):
    class Meta:
        model = PurifierBrands
        exclude = ["id","brands"]

class ModalsForm(forms.ModelForm):
    class Meta:
        model = Modals
        exclude = ["id","brand","name","image","price"]

class DescriptionsForm(forms.ModelForm):
    class Meta:
        model = Descriptions
        exclude = ["id","description","modal"]

class FeaturesForm(forms.ModelForm):
    class Meta:
        model = Features
        exclude = ["id","features","modal"]

class ServiceChargesForm(forms.ModelForm):
    class Meta:
        model = ServiceCharges
        exclude = ["id","service","price"]




