from equipments.models import PurchasedFactor, PressureFactor, SubEquipment, Equipment, BareModuleCostFactor, EspecialEquipmentsMethods
from equipments.services.AuxiliarTools import Services
from equipments.services.dev_suport import teste_print
import math


class GenericEquipment(EspecialEquipmentsMethods):
    def __init__(self, id=None) -> None:
        if id is not None:
            self.equipment = self.getEquipmentById(id)
            self.subequipmentsList = self.subEquipmentsFromEquipment(id)
            self.has_cost_corrections = False
            self.list_cbm_factors = self.cbmEquipmentListFactors()
        else:
            pass

    def getEquipmentById(self, id):
        """
        Retorna um equipamento informado o id
        """
        return Equipment.objects.get(id=id)

    def subEquipmentsFromEquipment(self, equipment_id):
        """
        Retorna uma lista de subequipamentos dados o id do equipamento
        """
        return SubEquipment.objects.filter(equipment=equipment_id)

    def getEquipmentPressureFactor(self):
        return PressureFactor.objects.filter(subequipment__equipment=self.equipment).all()

    def getSubEquipment(self, id) -> SubEquipment:
        """
        Retorna um sub-equipamento dado seu id
        """
        return SubEquipment.objects.get(id=id)

    def setSubequipment(self, idSubequipment) -> SubEquipment:
        self.subequipment = self.getSubEquipment(idSubequipment)
        return self.subequipment

    def cbmEquipmentListFactors(self):
        return BareModuleCostFactor.objects.filter(subequipment__equipment=self.equipment).all()

    def cbmSubequipmentListFactors(self, subequipment) -> BareModuleCostFactor:
        return BareModuleCostFactor.objects.filter(subequipment=subequipment).get()

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

    def generateCostEstimate(self, data, full_report=False):
        # [TODO]: Colocar aqui estapas de validação e configuração
        self.data = data
        self.calculateCosts(data)

    def fobEstimate(self, data, pf=None):
        if pf is None:
            pf = self.queryPurchaseBySubEquip(self.subequipment)
        di = data["dimension"]
        aux1 = pf.k2 * math.log10(di)
        aux2 = pf.k3 * (math.log10(di)**2)
        cost = (10 ** (pf.k1 + aux1 + aux2)) * (data["spares"] + 1)
        return cost

    def queryPurchaseBySubEquip(self, subequipment: SubEquipment):
        """
        Consulta e retorna as constantes relativas ao custo de compra FOB do equipamento
        """
        return PurchasedFactor.objects.filter(subequipment=subequipment).get()

    def queryPressureFactor(self, subequipment: SubEquipment, pressure: float):
        """
        Consulta e retorna as constantes relativas ao custo de compra FOB do equipamento
        """
        # p = PressureFactor.objects.filter(subequipment=subequipment, pressure_max__gte=pressure, pressure_min__lte=pressure).get()
        p = PressureFactor.objects.filter(subequipment=subequipment, pressure_max__gte=pressure, pressure_min__lte=pressure)
        results = p.count()
        if results < 1:
            # lançar erro aqui.
            pass
        elif results > 1:
            # Resultado exatamente no limiar. Escolhe-se o superior aumentando em 1% a presão
            pressure = pressure + pressure * 0.01
            return self.queryPressureFactor(subequipment, pressure)
        else:
            return p.get()

    def checkEstimativeConditions(self, data: dict, equipment_id, factors: BareModuleCostFactor) -> dict:
        # constants = PurchasedFactor.objects.filter(equipment_id=id, description=type).first()
        se = self.getSubEquipment(data["id"])
        self.subequipment = se
        # dimension = data[(self.equipment.dimension.dimension.dimension.lower())]
        erro_message = "Não foi possível fazer a estimativa. "

        if equipment_id != self.subequipment.equipment.id:
            return{
                "checked": False,
                "message": erro_message + "O equipamento " + self.equipment.name + " não possui a opção '" + self.subequipment.description + "' (id:" + str(self.subequipment.id) + "). Favor verificar."
            }
        elif data["dimension"] > se.max_dimension:
            return{
                "checked": False,
                "message": erro_message + "O valor informado foi acima do permitido (" + str(se.max_dimension) + self.equipment.dimension.unity + ")"
            }
        elif data["dimension"] < se.min_dimension:
            return{
                "checked": False,
                "message": erro_message + "O valor informado foi abaixo do permitido (" + str(se.min_dimension) + self.equipment.dimension.unity + ")"
            }
        elif 'pressure' not in data.keys() and self.hasPressure() is True:
            return{
                "checked": False,
                "message": erro_message + "Confira se todos as informações necessárias foram enviadas."
            }
        else:
            return{
                "checked": True,
                "message": None
            }

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

    def baseCost(self, pf: PurchasedFactor, data: dict) -> float:
        cost = self.fobEstimate(data, pf)
        inflation = self.inflationCorretion(data)
        return(cost * inflation)

    def calculateFbm(self):
        return 1

    def bareModuleCost(self, cost: float, pf: PurchasedFactor, factors: BareModuleCostFactor) -> float:
        if factors.fbm is True:
            return (cost * pf.fbm)
        else:
            fbm = self.calculateFbm()
            return (cost * fbm)

    def setCbmProcedure(self):
        """
        Setar uma lista de correções que devem ser aplicadas ao calculo do cbm.
        """
        self.cbm = self.cbmSubequipmentListFactors(self.subequipment)
        return self.cbm

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

    def hasPressure(self):
        complements = Services().querySetToDict(self.list_cbm_factors, "subequipment_id")
        for c in complements.values():
            if c["fpressure"] is True:
                return True
        return False

    # calculateCosts
    def calculateCosts(self, data: dict):

        # Retorna tabela booleana de configuração para calculo do baremodule
        factors = self.cbmSubequipmentListFactors(self.subequipment)
        # Import necessary data and calculate basic cost (already )
        pf = self.queryPurchaseBySubEquip(self.subequipment)

        if factors.fbm is True:
            fbm = pf.fbm
        else:
            fbm = self.calculateFbm()

        # Fatores Padrões de bm, para caso não haja correção de material ou pressão
        pressure_factor = 1
        fbm_ref = pf.fbm

        # Caso haja algum metodo especifico do equipamento...
        if factors.specialMethod is True:
            return self.specificCalculateCost(self, data)

        # Caso não haja metodo especial...
        # ... mas tenha correção da pressão
        if factors.fpressure is True:
            pressure_factor = self.pressureFactorCalc(self.subequipment, data["pressure"])
        # ... mas tenha correção de material
        if factors.material_correction is True:
            sub_ref = self.getSubEquipment(pf.reference_material_id)
            fbm_ref = self.queryPurchaseBySubEquip(sub_ref).fbm

        base_cost = round(self.baseCost(pf, data, fbm), 2)
        # Calculo dos custos e bare modules...
        material_factor = (pf.fbm / fbm_ref)

        # Preço fob corrigido pelo material
        self.purchase_equipment_cost = round((base_cost * material_factor) * pressure_factor, 2)
        # BareModule to material
        self.bare_module_cost = round(self.bareModuleCost(base_cost, pf) * pressure_factor, 2)
        # Equipment Cost do equipamento CS
        self.base_equipment_cost = round(base_cost, 2)
        # Bare Module do equipamento CS
        self.base_bare_module_cost = round(base_cost * fbm_ref)
        # Base cost, estimativa inicial -> Para resumo simplificado. Rever necessidade depois
        self.base_cost = round(base_cost, 2)

    def fbmByEquation(self):
        pass

    def specificCalculateCost(self, data):
        # importar aqui depois todos os dados de todas as tabelas desse equipamento

        self.purchase_factor = self.queryPurchaseBySubEquip(self.subequipment)
        # Preço fob corrigido pelo material
        self.purchase_equipment_cost = 0
        # BareModule to material
        self.bare_module_cost = 0
        # Equipment Cost do equipamento CS
        self.base_equipment_cost = 0
        # Bare Module do equipamento CS
        self.base_bare_module_cost = 0
        # Base cost, estimativa inicial -> Para resumo simplificado. Rever necessidade depois
        self.base_cost = 0
        pass
