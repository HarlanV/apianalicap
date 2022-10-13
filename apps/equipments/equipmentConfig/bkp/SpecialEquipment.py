from equipments.models import PurchasedFactor, PressureFactor, SubEquipment, Equipment, CostMethodsGuide
from equipments.services.dev_suport import teste_print
from equipments.equipmentConfig.BaseEquipment import BaseEquipment


class SpecialEquipmentCost():

    def __init__(self) -> None:
        pass

    def calculateCosts(self, equipment):
        return None


class SpecialEquipmentForm(BaseEquipment):
    """
    Auxiliar para geração de informativo de campos especiais a serem preenchidos pelo usuario
    """

    def __init__(self, equipment: Equipment, auxiliarEquipmentReport) -> None:
        self.equipment = equipment
        self.auxiliarReport = auxiliarEquipmentReport
        self.name = equipment.name.title().replace("-", "").replace(" ", "")

    def defatultSubequipmentDetail(self, subequipment: dict, guide: dict, pfactor) -> dict:
        return self.auxiliarReport.generalSubequipmentDetail(subequipment, guide, pfactor)

    def getDescription(self, equip_or_sub, guide: dict, pfactor=None) -> dict:
        if isinstance(equip_or_sub, SubEquipment):
            self.subEquipment = equip_or_sub
            self.pfactor = pfactor
            return getattr(self, self.name)(guide, False)
        elif isinstance(equip_or_sub, Equipment):
            return getattr(self, self.name)(guide, True)
        else:
            raise TypeError("Esperado um  tipo Equipment ou SubEquipment")

    def FiredHeater(self, guide, isEquipment=True) -> dict:
        # Fomulário de guia para usuario; Map
        form = {}
        if isEquipment is True:
            form["steam_superheat"] = "decimal, °C [When Required]"
        # Retorna a
        else:
            form = self.defatultSubequipmentDetail(self.subEquipment, guide, self.pfactor)
            if guide["specialMethod"] is True:
                form["steam_superheat_required"] = True
            else:
                form["steam_superheat_required"] = False
        return form

    def Tower(sefl, form, user_guide) -> dict:
        return form

    def Vessel(self, form, user_guide) -> dict:
        return form
