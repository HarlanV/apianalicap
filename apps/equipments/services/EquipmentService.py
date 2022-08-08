import json
from equipments.models import Equipment, SubEquipment
from django.forms.models import model_to_dict
from equipments.services.dev_suport import teste_print
from django.core.serializers.json import DjangoJSONEncoder


class EquipmentService():

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
        return Equipment.objects.all()

    def querySetToDict(self, qs, id="id") -> dict:
        """
        Função auxiliar para converter um QuerySet em dicionario
        obs: Não sendo utilizada no momento
        """
        var = {}
        for q in qs.values():
            var[q[id]] = dict(q)
        return var

    def querysetSerialize(self, data) -> str:
        """
        Recebe um queryset e converte em json
        """
        return json.dumps(list(data.values()), cls=DjangoJSONEncoder)

    def modelSerialize(self, data) -> str:
        """
        Recebe os dados de uma model e converte em json
        """
        var = model_to_dict(data)
        return json.dumps(var)

    def getSubEquipment(self, id):
        """
        Retorna um sub-equipamento dado seu id
        """
        return SubEquipment.objects.get(id=id)

    def listSubEquipment(self):
        """
        Retorna todos os sub-equipamentos cadastrados na base de dadoa
        """
        return SubEquipment.objects.all()

    def subEquipmentsFromEquipment(self, equipment_id):
        """
        Retorna uma lista de subequipamentos dados o id do equipamento
        """
        return SubEquipment.objects.filter(equipment=equipment_id)

    def getEquipmentForm(self, id):
        equipmentInstance = self.findEquipmentPath(id)
        subList = equipmentInstance.listAvailableSubequipment()
        form = equipmentInstance.mapDataToCreate()
        teste = {
            "available": subList,
            "post_map": form
        }
        return teste

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
        return response

        if args is not None:
            response = getattr(mod, equipmentClass)(**args)
        else:
            response = getattr(mod, equipmentClass)()
        return response

    def sampleDictSerialize(self, data):
        return json.dumps(data)

# function não mais nescessária, mas que pode servir no futuro 
#     def getAllEquipments(self, to_dict=False, serialize=False):
#         equipments = Equipment.objects.all()
#         if to_dict is True:
#             teste_print("entrou 1")
#             equipments = self.querySetToDict(equipments)
#             if serialize is True:
#                 teste_print("entrou 2")
#                 equipments = json.dumps(equipments)
#             # equipments = json.dumps(list(equipments.values()), cls=DjangoJSONEncoder)
#         teste_print(equipments)
#         return equipments