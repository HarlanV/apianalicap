from equipments.services.dev_suport import teste_print
from equipments.listOfEquipments.Turton.Basic import Form as BasicForm, BasicCost


class Form(BasicForm):

    def __init__(self, **kwargs) -> None:
        """
        equipment_id
        """
        super().__init__(**kwargs)

    def getEquipmentForm(self) -> dict:
        return {
            "available": super().detailSubequipment(),
            "model": super().costFields()
        }


class Cost(BasicCost):

    def __init__(self, **kwargs) -> None:
        super().__init__(**kwargs)

    def getEquipmentCost(self, data: dict) -> dict:
        # Checa e configura os dados recebidos
        super().checkFields(data)

        # realiza os calculos de custos

        # [TODO] ATENÇÃO:
        # A pressão de comparação no banco está em bar, porém o calculo deve ser feito em kpa. Atenção na hora de converter unidade.
        super().costEstimative()

        # formata no padrão que deve ser retornado
        return super().exportCosts()
