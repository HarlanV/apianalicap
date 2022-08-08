from django.urls import path

from . import views

app_name = 'equipments'

urlpatterns = [

    path('list', views.EquipmentApi().listEquipments, name='list_equipments'),
    path('<int:id>', views.EquipmentApi().getEquipment, name='get_equipment'),
    path('sub/list', views.EquipmentApi().listSubEquipment, name='list_equipments'),
    path('sub/<int:id>/list', views.EquipmentApi().subEquipmentsFromEquipment, name='get_equipment'),
    path('sub/<int:id>', views.EquipmentApi().getSubEquipment, name='get_equipment'),
    path('create/<int:id>', views.EquipmentApi().createEquipment, name='get_equipment'),
    # path('create/<int:id>', views.createEquipment, name='get_equipment'),
]
