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

        for eg in self.equipmentGuides.values():
            if eg["specialMethod"] is True:
                form = baseForm[eg["subequipment_id"]]
                info = {
                    "steam_superheat": "decimal [Required here]"
                }
                form.update(info)
                baseForm[eg["subequipment_id"]] = form
        return baseForm

    def specialFormModel(self, baseForm: dict) -> dict:
        info = {
            "steam_superheat": "decimal, °C [When Required]"
        }
        baseForm.update(info)
        return baseForm


class Cost(BasicCost):

    def __init__(self, **kwargs) -> None:
        super().__init__(**kwargs)

    def getEquipmentCost(self, data: dict) -> dict:
        # Checa e configura os dados recebidos
        self.checkFields(data)

        self.calcSuperHeatFactor()

        # realiza os calculos de custos
        self.costEstimative()

        # formata no padrão que deve ser retornado
        return self.exportCosts()

    def basicCheck(self, data: dict) -> None:
        super().basicCheck(data)
        guide = self.getSubquipmentGuide()
        if ('steam_superheat' not in data.keys() and guide.specialMethod is True):
            erro_message = "Não foi possível fazer a estimativa. "
            message = erro_message + "Confira se todos as informações necessárias foram enviadas."
            raise ValueError(message)
        return data

    def calcSuperHeatFactor(self):
        guide = self.getSubquipmentGuide()
        if guide.specialMethod is True:
            sh = self.data["steam_superheat"]
            fT = 1 + (0.00184 * sh) - (0.00000335 * (sh ** 2))
        else:
            fT = 1
        self.fT = fT
        return fT

    # Altera o metodo original utilizando o SuperHeatFactor
    def bareModuleCost(self, cost: float, pf: PurchasedFactor, guide: CostMethodsGuide, pressure_factor=1.0) -> float:
        return super().bareModuleCost(cost, pf, guide, pressure_factor) * self.fT

    # Altera o metodo original utilizando o SuperHeatFactor
    def purchaseEquipmentCost(self, base_cost: float, material_factor: float, pressure_factor: float) -> dict:
        return base_cost * material_factor * pressure_factor * self.fT
