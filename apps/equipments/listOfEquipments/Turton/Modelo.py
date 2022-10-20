from equipments.services.dev_suport import teste_print
from equipments.listOfEquipments.Turton.Basic import Form as BasicForm, BasicCost
from equipments.models import Equipment, SubEquipment, CostMethodsGuide, PurchasedFactor, MaterialFactor, PressureFactor


class Form(BasicForm):

    def __init__(self, **kwargs) -> None:
        """
        equipment_id
        """
        super().__init__(**kwargs)

    def getEquipmentForm(self) -> dict:
        return super().getEquipmentForm()

    def specialListSubequipments(self, baseForm: dict) -> dict:
        """
        Permite manipular o formulario padrão (baseForm) de listagem detalhada dos equipamentos
        """
        return baseForm

    def specialFormModel(self, baseForm: dict) -> dict:
        return baseForm


class Cost(BasicCost):

    def __init__(self, **kwargs) -> None:
        super().__init__(**kwargs)

    def getEquipmentCost(self, data: dict) -> dict:
        # Checa e configura os dados recebidos
        self.checkFields(data)

        # realiza os calculos de custos
        self.costEstimative()

        # formata no padrão que deve ser retornado
        return self.exportCosts()
