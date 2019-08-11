from django.conf.urls import url
from front_panel import views
app_name = 'front_panel'

urlpatterns=[
  url(r'^home/$',views.index, name="index")
]