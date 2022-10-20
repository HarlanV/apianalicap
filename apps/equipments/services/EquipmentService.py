import json
# from apps.equipments.listOfEquipments.index import EquipmentForm
from equipments.services.AuxiliarTools import Tools
# from equipments.equipmentConfig.EquipmentReports import EquipmentReports
from equipments.models import Equipment, SubEquipment
from equipments.services.dev_suport import teste_print
from django.db.models.query import QuerySet
from equipments.listOfEquipments.index import EquipmentCost, EquipmentForm
# from equipments.equipmentConfig.BaseEquipment import BaseEquipment


class EquipmentService(Tools):

    def __init__(self) -> None:
        pass

    def getEquipmentById(self, id: int) -> Equipment:
        """
        Retorna um equipamento informado o id
        """
        return Equipment.objects.get(id=id)

    def getAllEquipments(self) -> QuerySet[Equipment]:
        """
        Retorna um queryset com todos os equipamentos cadastrados na base
        """
        return Equipment.objects.all()

    def getSubEquipment(self, id: int) -> SubEquipment:
        """
        Retorna um sub-equipamento dado seu id
        """
        return SubEquipment.objects.get(id=id)

    def listSubEquipment(self) -> QuerySet[SubEquipment]:
        """
        Retorna todos os sub-equipamentos cadastrados na base de dadoa
        """
        return SubEquipment.objects.all()

    def subEquipmentsFromEquipment(self, equipment_id: int) -> QuerySet[SubEquipment]:
        """
        Retorna uma lista de subequipamentos dados o id do equipamento
        """
        return Equipment.subequipments(equipment_id)

    def getEquipmentForm(self, id: int) -> dict:
        """
        Retorna um dict com as opções disponiveis de subequipamento, bem como
        modelo de formulario para gerar orçamento
        """
        return EquipmentForm(equipment_id=id).getEquipmentForm()

    def postEquipmentForm(self, id, data: dict):

        data["equipment_id"] = id
        data["subequipment_id"] = data["id"]
        report = EquipmentCost(**data)
        return report.getEquipmentCost(data)["data"]
