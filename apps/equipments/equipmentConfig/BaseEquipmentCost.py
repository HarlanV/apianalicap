from equipments.models import PurchasedFactor, PressureFactor, SubEquipment, Equipment, CostMethodsGuide, MaterialFactor
from equipments.services.AuxiliarTools import Services
from equipments.services.dev_suport import teste_print
import math
from equipments.equipmentConfig.BaseEquipment import BaseEquipment


class BaseEquipmentCost(BaseEquipment):

    def __init__(self, id) -> None:
        self.setEquipment(id)

        pass

    def setBaseEstimativeVars(self, data: dict) -> None:
        self.setSubequipment(data["id"])
        self.subequipment = self.getSubequipment()
        self.setSubequipmentMethodsGuide(self.getSubequipment())
        self.setPurchaseFactor(self.getSubequipment())
        self.data = self.renameDataVar(data)

    def renameDataVar(self, data: dict) -> dict:
        """
        Rename the received values to match the pattern
        """
        equipment = self.getEquipment()
        dimension = equipment.dimension.dimension.dimension.lower()
        try:
            data["dimension"] = data[(dimension)]
        except KeyError as e:
            message = dimension + " argument is missing."
            raise TypeError(message)
        guide = self.getSubequipmentMethodsGuide()
        if guide.pressure_field_name is not None and guide.pressure_field_name in data.keys():
            data["pressure"] = data[guide.pressure_field_name]
        return data

    def baseCost(self, pf: PurchasedFactor, data: dict) -> float:
        cost = self.fobEstimate(data, pf)
        inflation = self.inflationCorretion(data)
        return(cost * inflation)

    # Calculo do custo fob pelas equação. Equação A.1, Turton (2018)
    def fobEstimate(self, data, pf=None) -> float:
        if pf is None:
            pf = self.queryPurchaseBySubEquip(self.subequipment)
        di = data["dimension"]
        aux1 = pf.k2 * math.log10(di)
        aux2 = pf.k3 * (math.log10(di)**2)
        cost = (10 ** (pf.k1 + aux1 + aux2)) * (data["spares"] + 1)
        return cost

    # Consulta e retorna fator de pressã0
    def subequipmentPressureFactor(self, subequipment: SubEquipment, pressure: float) -> float:
        """
        Consulta e retorna as constantes relativas ao custo de compra FOB do equipamento
        """
        # pf = PressureFactor.objects.filter(subequipment=subequipment, pressure_max__gte=pressure, pressure_min__lte=pressure).all()
        pf = super().queryPressureFactor(subequipment, pressure)

        results = pf.count()
        if results < 1:
            raise ValueError("Valores de pressão incorretos ou não encontrados. Por favor, verifique as especificações.")
        elif results > 1:
            # Resultado exatamente no limiar. Escolhe-se o superior aumentando em 1% a presão
            pressure = pressure + pressure * 0.01
            # chama a si mesmo, com o valor de pressão ajustado
            self.pressureFactor = self.subequipmentPressureFactor(subequipment, pressure)
        else:
            self.setPressureFactor(pf.get())

        return self.getPressureFactor()

    def checkMandatoryArguments(self, data):
        guide = self.getSubequipmentMethodsGuide()

        if guide.fpressure is True and "pressure" not in data:
            raise TypeError("'pressure' value was expected")

    def checkUserInputedData(self):
        pass

    def checkEstimativeConditions(self, data: dict) -> dict:

        teste = self.checkMandatoryArguments(data)
        data = self.data
        se = self.getSubequipment()
        equipment = self.getEquipment()
        equipment_id = equipment.id

        erro_message = "Não foi possível fazer a estimativa. "

        if equipment_id != se.equipment.id:
            message = erro_message + "O equipamento " + self.equipment.name + " não possui a opção '" + self.subequipment.description + "' (id:" + str(self.subequipment.id) + "). Favor verificar."
            raise ValueError(message)

        elif data["dimension"] > se.max_dimension:
            message = erro_message + "O valor informado foi acima do permitido (" + str(se.max_dimension) + self.equipment.dimension.unity + ")"
            raise ValueError(message)

        elif data["dimension"] < se.min_dimension:
            message = erro_message + "O valor informado foi abaixo do permitido (" + str(se.min_dimension) + self.equipment.dimension.unity + ")"
            raise ValueError(message)

        elif 'pressure' not in data.keys() and self.subequipmentHasPressure() is True:
            message = erro_message + "Confira se todos as informações necessárias foram enviadas."
            raise ValueError(message)

    def inflationCorretion(self, data, method="cepci") -> float:
        if method == "cepci":
            pf = self.getPurchaseFactor()
            old_cepci = pf.cepci
            new_cepci = data["cepci"]
            inflation = new_cepci / old_cepci
        else:
            # colocar aqui o metodo da inflação
            inflation = 1
            pass
        return inflation

    def getFbm(self, pf: PurchasedFactor, isRef: bool, calculate: bool) -> float:
        """
        isRef: bool = is the equipment made of CS and/or operating at normal conditions ?
        calculate: should be calculate by the equation ?
        """

        # fbm tabelado do material desejado
        if calculate is False and isRef is False:
            fbm = pf.fbm
        # fbm tabelado em ambiente e CS
        elif calculate is False and isRef is True:
            sub_ref = self.getSubequipment(pf.reference_material_id)
            fbm = self.getPurchaseFactor(sub_ref).fbm
        # fbm calculado do material desejado
        elif calculate is True and isRef is False:
            fbm = self.calculateFbm(self.data, False)
        elif calculate is True and isRef is True:
            fbm = self.calculateFbm(self.data, True)
        else:
            pass
        return fbm

    def calculateFbm(self, data: dict, isRef: bool) -> float:
        factors = MaterialFactor.objects.filter(subequipment=self.subequipment).get()
        b1 = factors.b1
        b2 = factors.b2
        if isRef is False:
            fm = factors.fm
            fp = self.getPressureFactor(self.subequipment, data["pressure"])
        # para condições de ambiente e CS, temos os valores como unidade
        else:
            fm = 1
            fp = 1
        fbm = b1 + (b2 * fm * fp)
        return fbm

    def calculateCosts(self, data: dict) -> None:

        # Retorna tabela booleana de configuração para calculo do baremodule
        subequipment = self.subEquipment
        guide = self.getSubequipmentMethodsGuide(subequipment)

        # Import necessary data and calculate basic cost (already )
        pf = self.getPurchaseFactor()
        # fP -> Pressure
        if guide.fpressure is True and guide.fbm is True:
            pressure_factor = self.pressureFactorCalc(self.subequipment, data["pressure"])
        else:
            pressure_factor = 1
        # fm e Fbm
        if guide.material_correction is True and guide.fbm is True:
            fbm = self.getFbm(pf, False, False)
            fbm_ref = self.getFbm(pf, True, False)
        elif guide.material_correction is False and guide.fbm is True:
            fbm = self.getFbm(pf, False, False)
            # Fatores Padrões de bm, para caso não haja correção de material ou pressão
            fbm_ref = fbm
        elif guide.material_correction is True and guide.fbm is False:
            fbm = self.getFbm(pf, False, True)
            fbm_ref = self.getFbm(pf, True, True)
        # para casos onde não haja correção de material, mas é preciso calcular fbm
        else:
            # [TODO]: Não deveria ocorrer, verficiar alternativas.
            # Até agora só surgiu com o tank, mas com erro na referencia da literatura.
            # self.data["pressure"] = 0.00001
            fbm = self.getFbm(pf, True, True)
            fbm_ref = fbm
        material_factor = (fbm / fbm_ref)

        # Calculo dos custos e bare modules...

        # Custo base (condições ambiente e CS)
        base_cost = round(self.baseCost(pf, data), 2)

        # Preço fob corrigido pelo material
        self.purchase_equipment_cost = round((base_cost * material_factor) * pressure_factor, 2)
        # BareModule to material
        self.bare_module_cost = round(self.bareModuleCost(base_cost, pf, guide) * pressure_factor, 2)
        # Equipment Cost do equipamento CS
        self.base_equipment_cost = round(base_cost, 2)
        # Bare Module do equipamento CS
        self.base_bare_module_cost = round(base_cost * fbm_ref, 2)
        # Base cost, estimativa inicial -> Para resumo simplificado. Rever necessidade depois
        self.base_cost = round(base_cost, 2)

    def bareModuleCost(self, cost: float, pf: PurchasedFactor, guide: CostMethodsGuide) -> float:
        calculate = not guide.fbm
        fbm = self.getFbm(pf, False, calculate)
        return (cost * fbm)

    def pressureFactorCalc(self, subequipment: SubEquipment, pressure: float):
        self.subequipmentPressureFactor(subequipment, pressure)
        pf_const = self.getPressureFactor()

        # bar -> unidade de calculo
        conversor = Services().getUnityConversor(pf_const.unityReference_id)
        pressure = pressure * conversor
        aux1 = pf_const.c1
        aux2 = pf_const.c2 * (math.log10(pressure))
        aux3 = pf_const.c3 * (math.log10(pressure)**2)
        # Equation A.2 from Turton (2018)
        return (10 ** (aux1 + aux2 + aux3))
