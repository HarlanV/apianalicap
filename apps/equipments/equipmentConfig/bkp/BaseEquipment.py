from ast import Return
from equipments.models import PurchasedFactor, PressureFactor, SubEquipment, Equipment, CostMethodsGuide, MaterialFactor
from equipments.services.AuxiliarTools import Services
from equipments.services.dev_suport import teste_print
from django.db.models.query import QuerySet
import math


class BaseEquipment():
    """
    This Class has the basics functions and attributes of an Equipment, without any estimating cost function
    """
    def __init__(self) -> None:
        pass

    # Set an equipment inside this class, withour returns it
    def setEquipment(self, id: int) -> None:
        """
        Set an equipment inside this class, withour returns it
        """
        self.equipment = Equipment.objects.get(id=id)

    # Returns a equipment already setted. If id is not empty, it will query this equipment, without set it
    def getEquipment(self, id=None) -> Equipment:
        """
        Returns a equipment already setted. If id is not empty, it will query this equipment, without set it.
        id[int] = Id from equipment.
        """
        if id is None:
            return self.equipment
        else:
            return SubEquipment.objects.get(id=id)

    # Set an equipment without returns it
    def setSubequipment(self, id: int) -> None:
        """
        Set a equipment inside a variable "subEquipment" without returns it
        """
        self.subEquipment = SubEquipment.objects.get(id=id)

    # Returns a equipment already setted. If id is not empty, it will query this equipment, without set it.
    def getSubequipment(self, id=None) -> SubEquipment:
        """
        Returns a equipment already setted. If id is not empty, it will query this equipment, without set it.
        id[int] = Id from equipment.
        """
        if id is None:
            return self.subEquipment
        else:
            return SubEquipment.objects.get(id=id)

    # Returns a list(QuerySet) of all equipments saved
    def listEquipments(self) -> QuerySet[Equipment]:
        """
        Returns a list(QuerySet) of all equipments saved
        """
        return Equipment.objects.all()

    # Returns a list(QuerySet) of all subequipments saved
    def listSubequipment(self) -> QuerySet[SubEquipment]:
        """
        Returns a list(QuerySet) of all subequipments saved
        """
        return SubEquipment.objects.all()

    # Retuns a list of all subequipments of an equipments
    def listSubequipmentByEquipment(self, equipment_id: int) -> QuerySet[SubEquipment]:
        """
        Retuns a list of all subequipments of an equipments
        """
        teste = Equipment.subequipments(equipment_id)
        teste_print(teste)
        return teste
        return SubEquipment.objects.filter(equipment=equipment_id)

    # Returns a list of all Pressure Factors (model PressureFactor) related to this equipment. If no equipment was provided,
    # it will look for the variable 'equipment' that was setted.
    def listEquipmentPressureFactor(self, id=None) -> QuerySet[PressureFactor]:
        """
        Returns a list of all Pressure Factors related to this equipment. If no equipment was provided,
        it will look for the variable 'equipment' that was setted.
        """
        if id is None:
            equipment = self.equipment
        else:
            equipment = self.getEquipment(id)
        return PressureFactor.objects.filter(subequipment__equipment=equipment).all()

    # Returns a list of all Pressure Factors (model CostMethodsGuide) related to this equipment. If no equipment was provided,
    # it will look for the variable 'equipment' that was setted.
    def listEquipmentMethodsGuide(self) -> QuerySet[CostMethodsGuide]:
        """
        Returns a list of all Pressure Factors (model CostMethodsGuide) related to this equipment. If no equipment was provided,
        it will look for the variable 'equipment' that was setted.
        It will return a QuerySet type
        """
        return CostMethodsGuide.objects.filter(subequipment__equipment=self.equipment).all()

    # set a CostMethodGuide of an equipment
    def setSubequipmentMethodsGuide(self, subequipment: SubEquipment) -> None:
        self.costMethodGuide = CostMethodsGuide.objects.filter(subequipment=subequipment).get()

    def getSubequipmentMethodsGuide(self, subequipment=None) -> CostMethodsGuide:
        if subequipment is None:
            return self.costMethodGuide
        else:
            return CostMethodsGuide.objects.filter(subequipment=subequipment).get()

    def setPurchaseFactor(self, subequipment: SubEquipment) -> None:
        self.purchaseFactor = PurchasedFactor.objects.filter(subequipment=subequipment).get()

    # Consulta e retorna as constantes relativas ao custo de compra FOB do equipamento
    def getPurchaseFactor(self, subequipment=None) -> PurchasedFactor:
        """
        Consulta e retorna as constantes relativas ao custo de compra FOB do equipamento
        """
        if subequipment is None:
            return self.purchaseFactor
        else:
            return PurchasedFactor.objects.filter(subequipment=subequipment).get()

    def queryPressureFactor(self, subequipment: SubEquipment, pressure: float) -> QuerySet[PressureFactor]:
        pressureFactor = PressureFactor.objects.filter(subequipment=subequipment, pressure_max__gte=pressure, pressure_min__lte=pressure)
        return pressureFactor

    def setPressureFactor(self, pressureFactor: PressureFactor):
        self.pressureFactor = pressureFactor

    def getPressureFactor(self) -> PressureFactor:
        return self.pressureFactor

    # Returns a bool if this equipment has any subequipment that requires a pressure type of info
    def equipmentHasPressure(self) -> bool:
        """
        Returns a bool if this equipment has any subequipment that requires a pressure type of info
        """
        ListGuides = self.listEquipmentMethodsGuide()
        complements = Services().querySetToDict(ListGuides, "subequipment_id")

        for c in complements.values():
            if c["fpressure"] is True:
                return True
        return False

    # Returns a bool if this subequipment requires a pressure type o information
    def subequipmentHasPressure(self) -> bool:
        """
        Returns a bool if this subequipment requires a pressure type o information
        """
        var = self.getSubequipmentMethodsGuide()
        return var.fpressure
