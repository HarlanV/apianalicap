from equipments.services.dev_suport import teste_print
from equipments.models import Equipment, SubEquipment, CostMethodsGuide
from django.db.models.query import QuerySet
from equipments.services.AuxiliarTools import Tools
from django.core.exceptions import ObjectDoesNotExist
from equipments.listOfEquipments.Turton.Basic import Form as BasicForm, BasicCost


class EquipmentForm():

    def __init__(self, **kwargs) -> None:
        """
        equipment_id
        """
        self.equipment_id = kwargs.get('equipment_id')
        self.subequipment_id = kwargs.get('subequipment_id')

    def getEquipmentForm(self) -> dict:

        equipment = self.findEquipmentPath(self.equipment_id)
        return equipment.getEquipmentForm()

    def findEquipmentPath(self, id: int, args=None) -> BasicForm:
        """
        args = variáveis nescessárias para instacia da classe
        """
        equipment = Equipment.objects.get(id=id)

        name = equipment.name.title().replace("-", "").replace(" ", "")

        equipmentPath = "equipments.listOfEquipments.Turton." + name
        # equipmentPath = "equipments.equipmentConfig." + name
        equipmentClass = "Form"
        mod = __import__(equipmentPath, fromlist=[equipmentClass])
        if args is not None:
            args["equipment_id"] = id
            response = getattr(mod, equipmentClass)(**args)
        else:
            response = getattr(mod, equipmentClass)(equipment_id=id)
        return response


class EquipmentCost():

    def __init__(self, **kwargs) -> None:
        """
        equipment_id
        """
        self.equipment_id = kwargs.get('equipment_id')
        self.subequipment_id = kwargs.get('subequipment_id')

    def getEquipmentCost(self, data) -> dict:

        equipment = self.findEquipmentPath(self.equipment_id, data)
        data = {"data": equipment.getEquipmentCost(data)}
        return self.defaultReponseToUser(200, data)

        try:
            data = {"data": equipment.getEquipmentCost(data)}
            return self.defaultReponseToUser(200, data)
        except ValueError as ve:
            data = {"message": ve.args[0]}
            return self.defaultReponseToUser(422, data)
        except ObjectDoesNotExist as objne:
            data = {"message": "As informações do equipamento não foram localizadas. Favor verificar se o Id foi preenchido corretamente."}
            return self.defaultReponseToUser(422, data)
        except TypeError as e:
            return self.defaultReponseToUser(422, str(e))

    def defaultReponseToUser(self, status_code: int, data) -> dict:
        return {
            "status_code": status_code,
            "data": data
        }

    def findEquipmentPath(self, id: int, args=None) -> BasicCost:
        """
        args = variáveis nescessárias para instacia da classe
        """
        equipment = Equipment.objects.get(id=id)

        name = equipment.name.title().replace("-", "").replace(" ", "")

        equipmentPath = "equipments.listOfEquipments.Turton." + name
        # equipmentPath = "equipments.equipmentConfig." + name
        equipmentClass = "Cost"
        mod = __import__(equipmentPath, fromlist=[equipmentClass])
        if args is not None:
            args["equipment_id"] = id
            response = getattr(mod, equipmentClass)(**args)
        else:
            response = getattr(mod, equipmentClass)(equipment_id=id)
        return response
