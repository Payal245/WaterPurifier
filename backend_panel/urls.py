from django.conf.urls import url
from backend_panel import views


app_name = 'backend_panel'

urlpatterns = [
   url(r'^purifier_brands/$',views.brands),
   url(r'^purifier_modals/$',views.modal_details),
   url(r'^description/$',views.description),
   url(r'^features/$',views.features),
   url(r'^service/$',views.service),
   url(r'^top_brand/$',views.top_brand),
   url(r'^update_brands/$',views.update_brands),
   url(r'^update_top_brand/$',views.update_top_brands),
   url(r'^update_models/$',views.update_models),
   url(r'^update_description/$',views.update_description),
   url(r'^update_features/$',views.update_features),
   url(r'^edit_brands/$', views.edit_brands, name="edit_brands"),
   url(r'^delete_brands/$', views.del_brands, name="delete_brands"),
   url(r'^edit_top_brand/$', views.edit_top_brand, name="edit_top_brand"),
   url(r'^delete_top_brand/$', views.delete_top_brand, name="delete_top_brand"),
   url(r'^edit_models/$', views.edit_models, name="edit_models"),
   url(r'^delete_models/$', views.delete_modals, name="delete_models"),
   url(r'^edit_description/$', views.edit_description, name="edit_description"),
   url(r'^delete_description/$', views.delete_description, name="delete_description"),
   url(r'^edit_features/$', views.edit_features, name="edit_features"),
   url(r'^delete_features/$', views.delete_features, name="delete_features"),
   url(r'^update_service/$',views.update_service),
   url(r'^edit_service/$', views.edit_service, name="edit_service"),
   url(r'^delete_service/$', views.del_service, name="delete_service"),
   url(r'^gallery/$',views.gallery),
   url(r'^brand_detail/$', views.brands_detail,name="brands_detail"),
   url(r'^model_detail/$', views.model_detail,name="model_detail"),
   url(r'^service_detail/$',views.service_details),
   url(r'^aquagaurd_parts/$',views.aquagaurd_parts),
   url(r'^update_parts/$',views.update_aquagaurd_parts),
   url(r'^edit_parts/$',views.edit_parts,name="edit_parts"),
   url(r'^delete_parts/$',views.delete_parts,name="delete_parts"),
   url(r'^purifier_parts/$', views.purifier_parts),









]