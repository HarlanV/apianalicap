
from django.http import HttpResponse
from django.shortcuts import render
from django.views.generic import View
from equipments.services.EquipmentService import EquipmentService
from equipments.services.dev_suport import teste_print
# Create your views here.


class EquipmentApi(View):

    def getEquipment(request, id):
        """
        Retorna um equipamento dado seu id
        """
        service = EquipmentService()
        equipment = service.getEquipmentById(id)

        return HttpResponse(
            service.modelSerialize(equipment),
            content_type="application/json"
        )

    def listEquipments(request):
        """
        Lista todos os equipamentos
        """
        service = EquipmentService()
        equipments = service.getAllEquipments()

        # TODO: Colocar resultado para caso vazio.
        return HttpResponse(
            service.querysetSerialize(equipments),
            content_type="application/json"
        )

    def getSubEquipment(request, id):
        """
        Retorna um sub-equipamento dado seu id
        """
        service = EquipmentService()
        subequipment = service.getSubEquipment(id)

        return HttpResponse(
            service.modelSerialize(subequipment),
            content_type="application/json"
        )

    def listSubEquipment(request):
        """
        Retorna todos os sub-equipamentos cadastrados na base de dadoa
        """
        service = EquipmentService()
        subequipments = service.listSubEquipment()

        # TODO: Colocar resultado para caso vazio.
        return HttpResponse(
            service.querysetSerialize(subequipments),
            content_type="application/json"
        )

    def subEquipmentsFromEquipment(request, id):
        """
        Retorna uma lista de subequipamentos dados o id do equipamento
        """
        service = EquipmentService()
        subequipments = service.subEquipmentsFromEquipment(id)

        # TODO: Colocar resultado para caso vazio.
        return HttpResponse(
            service.querysetSerialize(subequipments),
            content_type="application/json"
        )
