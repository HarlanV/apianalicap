from equipments.services.dev_suport import teste_print
from equipments.equipmentConfig.BaseEquipmentCost import BaseEquipmentCost
from equipments.equipmentConfig.BaseEquipmentForm import BaseEquipmentForm


class EquipmentCost(BaseEquipmentForm, BaseEquipmentCost):

    def __init__(self, id) -> None:
        super()
        self.setEquipment(id)
        self.subequipmentsList = self.listSubequipmentByEquipment(id)
        # self.list_cbm_factors = self.listEquipmentMethodsGuide()

    def costEstimative(self, data) -> dict:
        if self.dataValidate(data) is True:
            self.data = data
            self.calculateCosts(data)
            return self.exportCosts()
        else:
            raise ValueError("Dados inconsistentes")

    def dataValidate(self, data) -> bool:
        return True
