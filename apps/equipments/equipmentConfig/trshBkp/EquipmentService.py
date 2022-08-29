import json
from equipments.services.AuxiliarTools import Services
from equipments.equipmentConfig.EquipmentReports import EquipmentReports
from equipments.models import Equipment, SubEquipment
from equipments.services.dev_suport import teste_print
from equipments.equipmentConfig.BaseEquipment import BaseEquipment


class EquipmentService(Services):

    def __init__(self) -> None:
        pass

    def getEquipmentById(self, id):
        """
        Retorna um equipamento informado o id
        """

        return Equipment.objects.get(id=id)

    def getAllEquipments(self):
        """
        Retorna um queryset com todos os equipamentos cadastrados na base
        """
        return BaseEquipment().listEquipments()

    def getSubEquipment(self, id) -> SubEquipment:
        """
        Retorna um sub-equipamento dado seu id
        """
        return BaseEquipment().getSubequipment(id)

    def listSubEquipment(self):
        """
        Retorna todos os sub-equipamentos cadastrados na base de dadoa
        """
        return BaseEquipment().listSubequipment()

    def subEquipmentsFromEquipment(self, equipment_id):
        """
        Retorna uma lista de subequipamentos dados o id do equipamento
        """
        return BaseEquipment().listSubequipmentByEquipment(equipment_id)

    def getEquipmentForm(self, id) -> dict:
        """
        Retorna um dict com as opções disponiveis de subequipamento, bem como
        modelo de formulario para gerar orçamento
        """

        return EquipmentReports(id).getEquipmentForm()

    def postEquipmentForm(self, id, data: dict):
        report = EquipmentReports(id)
        return report.costEstimateReport(data, id)["data"]

    # [desativado]
    # Função auxiliar para chamar dinamicamente os modulos de equipamentos
    def findEquipmentPath(self, id: int, args=None):
        """
        args = variáveis nescessárias para instacia da classe
        """
        equipment = Equipment.objects.get(id=id)
        name = equipment.name.title().replace("-", "").replace(" ", "")

        equipmentPath = "equipments.equipmentConfig." + name
        equipmentClass = name
        mod = __import__(equipmentPath, fromlist=[equipmentClass])
        response = getattr(mod, equipmentClass)(id=id)

        # O campo abaixo por ser nescessário para equipamentos mais complexos.
        # Não remover até o final do desenvolvimento!
        # if args is not None:
        #     response = getattr(mod, equipmentClass)(**args)
        # else:
        #     response = getattr(mod, equipmentClass)()

        return response
