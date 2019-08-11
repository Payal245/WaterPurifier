"""WaterPurifier URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from front_panel import views
from django.conf.urls import url, include
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    url(r'^$',views.index),
    url(r'^', include('front_panel.urls')),
    url(r'^', include('backend_panel.urls')),
    url(r'^registration/$', views.registration),
    url(r'^update_password/$',views.update_password),
    url(r'^verify_link/$', views.verify_link),
    url(r'^login/$',views.login),
    url(r'^logout/$', views.logout),
    url(r'^forgot_password/$',views.forgot_password),
    url(r'^admin_index/$',views.admin_index),
    url(r'^update_admin_profile/$',views.admin_update_profile),
    url(r'^update_admin_password/$',views.admin_update_password),
    url(r'^User_search/$', views.user_search),


]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
