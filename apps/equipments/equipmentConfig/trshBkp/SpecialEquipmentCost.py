from equipments.models import PurchasedFactor, PressureFactor, SubEquipment, Equipment, CostMethodsGuide
from equipments.services.dev_suport import teste_print
from equipments.equipmentConfig.BaseEquipment import BaseEquipment


class SpecialEquipmentCost():

    def __init__(self) -> None:
        pass

    def calculateCosts(self, equipment):

        # mapeamento de casos especiais
        if equipment.id == 11:
            return self.firedHeatersMethod

    def baseCost(self):
        pass

    def calculateCostsNoFbm(self, data):
        b1 = 1
        b2 = 1
        fm = 1
        fp = 1
        fbm = (b1 + (b2 * fm * fp))
        base_cost = round(self.baseCost(pf, data, fbm), 2)

    def especialFormSubequiments(self, equipment: Equipment, form: dict) -> dict:

        return SpecialEquipmentForm(equipment, form).getUserForm()


class SpecialEquipmentForm(BaseEquipment):
    """
    Auxiliar para geração de informativo de campos especiais a serem preenchidos pelo usuario
    """

    def __init__(self, equipment: Equipment, form: dict) -> None:
        self.equipment = equipment
        self.form = form
        self.name = equipment.name.title().replace("-", "").replace(" ", "")

    def defaultForm(self):
        pass

    def getUserForm(self) -> dict:
        return getattr(self, self.name)(self.form, True)

    def FiredHeater(self, form, user_guide=True) -> dict:
        # Fomulário de guia para usuario; Map
        if user_guide is True:
            form["steam_superheat"] = "(Steam Based) decimal, °C;"
        # Retorna a 
        else:
            pass
        return form

    def Tower(sefl, form) -> dict:
        return form

    def Vessel(self, form) -> dict:
        return form
