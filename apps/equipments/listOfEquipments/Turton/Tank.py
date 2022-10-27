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

    # [TODO]: Solução rapida para problema de bomba. Rever o banco
    # Problema: apesar de possuir pressão maxima, não está sendo usado no calculo.
    def insertSubPressure(self, sb: SubEquipment, info: dict, guide: dict, pfactor) -> dict:
        return info


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

    def calculateFbm(self, data: dict, isRef: bool) -> float:
        factors = MaterialFactor.objects.filter(subequipment=self.subequipment).get()
        b1 = factors.b1
        b2 = factors.b2
        fm = factors.fm
        fp = 1
        fbm = b1 + (b2 * fm * fp)
        return fbm