from django import forms
from front_panel.models import RoleDetails

class RoleDetailsForm(forms.ModelForm):
    class Meta:
        model = RoleDetails
        exclude = ["name","email","password","mobile","image","gender","address","otp","active","verify_link","auth_token"]
