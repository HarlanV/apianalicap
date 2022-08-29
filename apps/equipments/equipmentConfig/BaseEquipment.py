from equipments.models import PurchasedFactor, PressureFactor, SubEquipment, Equipment, CostMethodsGuide, MaterialFactor
from equipments.services.AuxiliarTools import Services
from equipments.services.dev_suport import teste_print
from django.db.models.query import QuerySet
import math


class BaseEquipment():
    def __init__(self) -> None:
        pass

    # Define dentro da intancia o equipamento utilizado
    def setEquipment(self, id: int) -> None:
        """
        Define dentro da intancia o equipamento utilizado
        """
        self.equipment = Equipment.objects.get(id=id)

    # Retorna um equipamento recebendo seu Id
    def getEquipment(self) -> Equipment:
        """
        Retorna um equipamento informado o id
        """
        return self.equipment

    def setSubequipment(self, id: int) -> None:
        self.subEquipment = SubEquipment.objects.get(id=id)

    def getSubequipment(self) -> SubEquipment:
        return self.subEquipment

    def listEquipments(self) -> QuerySet[Equipment]:
        """
        Lista todos os equipamentos cadastrados na base
        """
        return Equipment.objects.all()

    def listSubequipment(self) -> QuerySet[SubEquipment]:
        """
        Retorna todos os sub-equipamentos cadastrados na base de dadoa
        """
        return SubEquipment.objects.all()

    def listSubequipmentByEquipment(self, equipment_id) -> QuerySet[SubEquipment]:
        """
        Retorna uma lista de subequipamentos dados o id do equipamento
        """
        return SubEquipment.objects.filter(equipment=equipment_id)

    def listEquipmentPressureFactor(self, id=None) -> QuerySet[PressureFactor]:
        if id is None:
            equipment = self.equipment
        else:
            equipment = self.getEquipment(id)
        return PressureFactor.objects.filter(subequipment__equipment=equipment).all()

    def listEquipmentMethodsGuide(self) -> QuerySet[CostMethodsGuide]:
        return CostMethodsGuide.objects.filter(subequipment__equipment=self.equipment).all()

    def setSubequipmentMethodsGuide(self, subequipment) -> None:
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

    def setPressureFactor(self, subequipment: SubEquipment, pressure: float) -> None:
        self.pressureFactor = PressureFactor.objects.filter(subequipment=subequipment, pressure_max__gte=pressure, pressure_min__lte=pressure)

    def listPressureFactor(self, subequipment: SubEquipment, pressure: float) -> None:
        self.pressureFactor = PressureFactor.objects.filter(subequipment=subequipment, pressure_max__gte=pressure, pressure_min__lte=pressure)

    def getPressureFactor(self) -> PressureFactor:
        return self.pressureFactor

    def equipmentHasPressure(self) -> bool:
        complements = Services().querySetToDict(self.list_cbm_factors, "subequipment_id")
        for c in complements.values():
            if c["fpressure"] is True:
                return True
        return False

    # [TODO]: Pendente
    def subequipmentHasPressure(self) -> bool:
        """
        Metodo não construido ainda. Pendente
        """
        guide = self.getSubequipmentMethodsGuide()
        return True
