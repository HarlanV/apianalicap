from equipments.models import PurchasedFactor, PressureFactor, SubEquipment, Equipment, CostMethodsGuide
from equipments.equipmentConfig.BaseEquipment import EquipmentCost
from equipments.services.AuxiliarTools import Services
from equipments.services.dev_suport import teste_print
import math


class GenericEquipment(EquipmentCost):
    def __init__(self, id=None) -> None:
        return super().__init__(id, True)

    def setCbmProcedure(self):
        """
        Setar uma lista de correções que devem ser aplicadas ao calculo do cbm.
        """
        self.cbm = self.cbmSubequipmentListFactors(self.subequipment)
        return self.cbm

    def firedHeater(self, data):
        pass

    def firedHeaterSeamBasedBoiler(self, data):

        # Retorna tabela booleana de configuração para calculo do baremodule
        guide = self.guide

        # Import necessary data and calculate basic cost (already )
        pf = self.queryPurchaseBySubEquip(self.subequipment)

        fbm = self.getFbm(pf, guide)

        # fbm_ref = fbm
        fbm_ref = fbm
        pressure_factor = self.pressureFactorCalc(self.subequipment, data["pressure"])

        if pressure_factor < 1:
            pressure_factor = 1

        if guide.material_correction is True:
            sub_ref = self.getSubEquipment(pf.reference_material_id)
            fbm_ref = self.queryPurchaseBySubEquip(sub_ref).fbm

        base_cost = round(self.baseCost(pf, data), 2)
        material_factor = (pf.fbm / fbm_ref)

        dt = data["steam_superheat"]

        ft = 1 + (0.00184 * dt) - (0.00000335 * (dt ** 2))

        # Preço fob corrigido pelo material
        self.purchase_equipment_cost = round((base_cost * material_factor * pressure_factor * ft), 2)
        # BareModule to material
        self.bare_module_cost = round(self.bareModuleCost(base_cost, pf, guide) * pressure_factor * ft, 2)
        # Equipment Cost do equipamento CS
        self.base_equipment_cost = round(base_cost, 2)
        # Bare Module do equipamento CS
        self.base_bare_module_cost = round(base_cost * fbm_ref, 2)
        # Base cost, estimativa inicial -> Para resumo simplificado. Rever necessidade depois
        self.base_cost = round(base_cost, 2)
        return self.exportCosts()
