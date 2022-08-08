
from django.http import HttpResponse
from django.shortcuts import render
from django.views.generic import View
from equipments.services.EquipmentService import EquipmentService
from equipments.services.dev_suport import teste_print
import json

# Create your views here.


class EquipmentApi(View):

    def __init__(self, **kwargs) -> None:
        super().__init__(**kwargs)

        # service principal a ser utilizado.
        self.service = EquipmentService()

    def getEquipment(self, request, id):
        """
        Retorna um equipamento dado seu id
        """
        equipment = self.service.getEquipmentById(id)

        return HttpResponse(
            self.service.modelSerialize(equipment),
            content_type="application/json"
        )

    def listEquipments(self, request):
        """
        Lista todos os equipamentos
        """
        equipments = self.service.getAllEquipments()

        # TODO: Colocar resultado para caso vazio.
        return HttpResponse(
            self.service.querysetSerialize(equipments),
            content_type="application/json"
        )

    def getSubEquipment(self, request, id):
        """
        Retorna um sub-equipamento dado seu id
        """
        subequipment = self.service.getSubEquipment(id)

        return HttpResponse(
            self.service.modelSerialize(subequipment),
            content_type="application/json"
        )

    def listSubEquipment(self, request):
        """
        Retorna todos os sub-equipamentos cadastrados na base de dadoa
        """
        subequipments = self.service.listSubEquipment()

        # TODO: Colocar resultado para caso vazio.
        return HttpResponse(
            self.service.querysetSerialize(subequipments),
            content_type="application/json"
        )

    def subEquipmentsFromEquipment(self, request, id):
        """
        Retorna uma lista de subequipamentos dados o id do equipamento
        """
        subequipments = self.service.subEquipmentsFromEquipment(id)

        # TODO: Colocar resultado para caso vazio.
        return HttpResponse(
            self.service.querysetSerialize(subequipments),
            content_type="application/json"
        )

    def createEquipment(self, request, id):
        if request.method == "GET":
            form = self.getFormInfoToCreate(id)
            data = self.service.sampleDictSerialize(form)
        elif request.method == "POST":
            data_form = json.loads(request.body.decode("utf-8"))["data"]
            data = self.postCreateEquipment(id, data_form)
            data = self.service.sampleDictSerialize(data)
        return HttpResponse(
            data,
            content_type="application/json"
        )

    def getFormInfoToCreate(self, id):
        return self.service.getEquipmentForm(id)

    def postCreateEquipment(self, id, data):
        return self.service.postEquipmentForm(id, data)
