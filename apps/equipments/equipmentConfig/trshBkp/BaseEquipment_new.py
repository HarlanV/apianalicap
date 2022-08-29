from equipments.models import PurchasedFactor, PressureFactor, SubEquipment, Equipment, CostMethodsGuide, MaterialFactor
from equipments.services.AuxiliarTools import Services
from equipments.services.dev_suport import teste_print
import math
from django.core.exceptions import ObjectDoesNotExist


class BaseEquipment():
    def __init__(self) -> None:
        pass

    # Define dentro da intancia o equipamento utilizado
    def setEquipment(self, id: int) -> None:
        """
        Define dentro da intancia o equipamento utilizado
        """
        self.equipment = self.getEquipment(id)

    # Retorna um equipamento recebendo seu Id
    def getEquipment(self, id: int) -> Equipment:
        """
        Retorna um equipamento informado o id
        """
        return Equipment.objects.get(id=id)

    def setSubequipment(self, id: int) -> None:
        self.subEquipment = self.getSubequipment(id)

    def getSubequipment(self, id: int) -> None:
        subequipment = SubEquipment.objects.get(id=id)
        return subequipment

    def listEquipments(self):
        """
        Retorna um queryset com todos os equipamentos cadastrados na base
        """
        return Equipment.objects.all()

    def listSubequipment(self):
        """
        Retorna todos os sub-equipamentos cadastrados na base de dadoa
        """
        return SubEquipment.objects.all()

    def listSubequipmentByEquipment(self, equipment_id):
        """
        Retorna uma lista de subequipamentos dados o id do equipamento
        """
        return SubEquipment.objects.filter(equipment=equipment_id)

    def listEquipmentPressureFactor(self, id=None):
        if id is None:
            equipment = self.equipment
        else:
            equipment = self.getEquipment(id)
        return PressureFactor.objects.filter(subequipment__equipment=equipment).all()

    def getEquipmentMethodsGuide(self):
        return CostMethodsGuide.objects.filter(subequipment__equipment=self.equipment).all()

    def getSubequipmentMethodsGuide(self, subequipment) -> CostMethodsGuide:
        return CostMethodsGuide.objects.filter(subequipment=subequipment).get()

    # Consulta e retorna as constantes relativas ao custo de compra FOB do equipamento
    def getPurchaseBySubequip(self, subequipment: SubEquipment) -> PurchasedFactor:
        """
        Consulta e retorna as constantes relativas ao custo de compra FOB do equipamento
        """
        return PurchasedFactor.objects.filter(subequipment=subequipment).get()

    def getPressureFactor(self, subequipment: SubEquipment, pressure: float) -> PressureFactor:
        return PressureFactor.objects.filter(subequipment=subequipment, pressure_max__gte=pressure, pressure_min__lte=pressure)

    def equipmentHasPressure(self):
        complements = Services().querySetToDict(self.list_cbm_factors, "subequipment_id")
        for c in complements.values():
            if c["fpressure"] is True:
                return True
        return False

    # [TODO]: Pendente
    def subequipmentHasPressure(self):
        """
        Metodo não construido ainda. Pendente
        """
        return True


class BaseEquipmentCost(BaseEquipment):

    def __init__(self, id) -> None:
        self.setEquipment(id)
        pass

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
    def getPressureFactor(self, subequipment: SubEquipment, pressure: float) -> float:
        """
        Consulta e retorna as constantes relativas ao custo de compra FOB do equipamento
        """
        # p = PressureFactor.objects.filter(subequipment=subequipment, pressure_max__gte=pressure, pressure_min__lte=pressure).get()
        p = super().getPressureFactor(subequipment, pressure)
        results = p.count()
        if results < 1:
            raise ValueError("Valores de pressão incorretos ou não encontrados. Por favor, verifique as especificações.")
        elif results > 1:
            # Resultado exatamente no limiar. Escolhe-se o superior aumentando em 1% a presão
            pressure = pressure + pressure * 0.01
            return self.queryPressureFactor(subequipment, pressure)
        else:
            return p.get()

    def checkEstimativeConditions(self, data: dict, equipment_id, guide: CostMethodsGuide) -> dict:

        se = self.getSubequipment(data["id"])

        # dimension = data[(self.equipment.dimension.dimension.dimension.lower())]
        erro_message = "Não foi possível fazer a estimativa. "

        if equipment_id != self.subequipment.equipment.id:
            message = erro_message + "O equipamento " + self.equipment.name + " não possui a opção '" + self.subequipment.description + "' (id:" + str(self.subequipment.id) + "). Favor verificar."
            raise ValueError(message)

        elif data["dimension"] > se.max_dimension:
            message = erro_message + "O valor informado foi acima do permitido (" + str(se.max_dimension) + self.equipment.dimension.unity + ")"
            raise ValueError(message)

        elif data["dimension"] < se.min_dimension:
            message = erro_message + "O valor informado foi abaixo do permitido (" + str(se.min_dimension) + self.equipment.dimension.unity + ")"
            raise ValueError(message)

        elif 'pressure' not in data.keys() and self.hasPressure() is True:
            message = erro_message + "Confira se todos as informações necessárias foram enviadas."
            raise ValueError(message)

    def inflationCorretion(self, data, method="cepci") -> float:
        if method == "cepci":
            pf = self.queryPurchaseBySubEquip(self.subequipment)
            old_cepci = pf.cepci
            new_cepci = data["cepci"]
            inflation = new_cepci / old_cepci
        else:
            # colocar aqui o metodo da inflação
            inflation = 1
            pass
        return inflation

    def getFbm(self, pf, isRef: bool, calculate: bool) -> float:
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
            fbm = self.getPurchaseBySubequip(sub_ref).fbm
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
        pf = self.queryPurchaseBySubEquip(self.subequipment)

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

        pf_const = self.queryPressureFactor(subequipment, pressure)

        # bar -> unidade de calculo
        conversor = Services().getUnityConversor(pf_const.unityReference_id)
        pressure = pressure * conversor
        aux1 = pf_const.c1
        aux2 = pf_const.c2 * (math.log10(pressure))
        aux3 = pf_const.c3 * (math.log10(pressure)**2)
        # Equation A.2 from Turton (2018)
        return (10 ** (aux1 + aux2 + aux3))


class BaseEquipmentForm(BaseEquipment):

    def __init__(self, id) -> None:
        self.setEquipment(id)
        self.name = self.equipment.name.title().replace("-", "").replace(" ", "")

    def listAvailableSubequipment(self) -> dict:
        """
        Cria um dict com informações nescessárias para orçamento de cada subequipment, para exportar
        """
        sl = self.subequipmentsList
        form = {}
        dimension = self.equipment.dimension.dimension.dimension
        unity = self.equipment.dimension.unity
        for se in sl.values():
            form[se["id"]] = {
                'id': se["id"],
                'subtype': se["description"],
                'material': se["material"],
                (dimension + ' max'): se["max_dimension"],
                (dimension + ' min'): se["min_dimension"],
                (dimension + ' unity'): unity,
            }
        return form

    def mapDataToCreate(self) -> dict:
        """
        Retorna uma modelo de como deve ser enviado a informação para realizar orçamento do equipamento.
        {
            nome_do_campo:"tipo de informação"
        }
        """
        dimension = self.equipment.dimension.dimension.dimension
        return {
            "id": "int",
            dimension: "decimal",
        }

    def exportCosts(self) -> dict:
        return {
            "purchase_equipment_cost": self.purchase_equipment_cost,
            "bare_module_cost": self.bare_module_cost,
            "base_equipment_cost": self.base_equipment_cost,
            "base_bare_module_cost": self.base_bare_module_cost,
        }


class EquipmentCost(BaseEquipmentForm, BaseEquipmentCost):
    def __init__(self, id) -> None:
        super()
        self.setEquipment(id)
        self.subequipmentsList = self.listSubequipmentByEquipment(id)
        self.list_cbm_factors = self.cbmEquipmentListFactors()

    def generateCostEstimate(self, data) -> dict:
        if self.dataValidate(data) is True:
            self.data = data
            self.calculateCosts(data)
            return self.exportCosts()
        else:
            raise ValueError("Dados inconsistentes")

    def dataValidate(self, data) -> bool:
        return True

    def setCbmProcedure(self):
        """
        Setar uma lista de correções que devem ser aplicadas ao calculo do cbm.
        """
        self.cbm = self.cbmSubequipmentListFactors(self.subequipment)
        return self.cbm
