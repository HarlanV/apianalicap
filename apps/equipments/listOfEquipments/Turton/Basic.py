
from equipments.services.dev_suport import teste_print
from equipments.models import Equipment, SubEquipment, CostMethodsGuide, PurchasedFactor, MaterialFactor, PressureFactor
from django.db.models.query import QuerySet
from equipments.services.AuxiliarTools import Tools
import math


class Form():

    def __init__(self, **kwargs) -> None:
        """
        equipment_id
        """
        self.subequipment_id = kwargs.get('subequipment_id')
        self.equipment_id = kwargs.get('equipment_id')
        self.equipment = Equipment.objects.get(id=self.equipment_id)

    def getEquipmentForm(self) -> dict:
        return {
            "available": self.detailSubequipment(),
            "model": self.costFields()
        }

    def listEquipmentPressureFactor(self, id=None) -> QuerySet[PressureFactor]:
        """
        Returns a list of all Pressure Factors related to this equipment.
        """
        return PressureFactor.objects.filter(subequipment__equipment=self.equipment).all()

    def __baseSubequipmentDetail(self):
        subequipmentsList = Equipment.subequipments(self.equipment_id)
        equipmentGuides = self.listEquipmentMethodsGuide()
        equipmentGuides = Tools().querySetToDict(equipmentGuides, "subequipment_id")
        self.equipmentGuides = equipmentGuides
        dimension = self.equipment.dimension.dimension.dimension.lower()
        unity = self.equipment.dimension.unity
        form = {}
        qsetPressure = self.listEquipmentPressureFactor()
        teste_print(Tools().querySetToDict(qsetPressure))
        pfactor = None
        if bool(qsetPressure):
            pfactor = qsetPressure

        for sb in subequipmentsList:
            subequipment = Tools().modelToDict(sb)
            info = {
                'id': subequipment["id"],
                'subtype': subequipment["description"],
                (dimension + ' max'): subequipment["max_dimension"],
                (dimension + ' min'): subequipment["min_dimension"],
                (dimension + ' unity'): unity,
            }

            info = self.insertSubMaterial(sb, info, equipmentGuides)
            if pfactor is not None:
                info = self.insertSubPressure(sb, info, equipmentGuides, pfactor)

            form[sb.id] = info
        return form

    def insertSubMaterial(self, sb: SubEquipment, info: dict, guide: dict) -> dict:
        if guide[sb.id]["material_correction"] is True:
            info["material"] = sb.material
        return info

    def insertSubPressure(self, sb: SubEquipment, info: dict, guide: dict, pfactor: QuerySet[PressureFactor]) -> dict:
        pf = pfactor.filter(subequipment_id=sb.id)
        pmax = 0
        pmin = 0
        for p in pf.values():
            pmax = p["pressure_max"] if (p["pressure_max"] > pmax) else pmax
            pmin = p["pressure_min"] if (p["pressure_min"] < pmin) else pmin
        pName = guide[sb.id]["pressure_field_name"]
        info["max_" + pName] = pmax
        info["min_" + pName] = pmin
        return info

    def __baseFormModel(self) -> dict:
        dimension = self.equipment.dimension.dimension.dimension.lower()
        userGuide = {
            "id": "int",
            "spares": "int [optional]",
            dimension: f"decimal ({self.equipment.dimension.unity})",
        }

        for guide in self.equipmentGuides.values():
            if guide["material_correction"] is True:
                userGuide["material"] = "string"
                break

        for guide in self.equipmentGuides.values():
            if guide["fpressure"] is True:
                userGuide[guide["pressure_field_name"]] = "decimal"
                break

        return userGuide

    # Guides
    def listEquipmentMethodsGuide(self) -> QuerySet[CostMethodsGuide]:
        """
        Returns a list of all Pressure Factors (model CostMethodsGuide) related to this equipment.
        return [QuerySet]
        """
        return CostMethodsGuide.objects.filter(subequipment__equipment=self.equipment).all()

    def costFields(self) -> dict:
        form = self.__baseFormModel()
        form = self.specialFormModel(form)
        return form

    def detailSubequipment(self) -> dict:
        form = self.__baseSubequipmentDetail()
        form = self.specialListSubequipments(form)
        return form

    def specialListSubequipments(self, baseForm: dict) -> dict:
        """
        Permite manipular o formulario padrão (baseForm) de listagem detalhada dos equipamentos
        """
        return baseForm

    def specialFormModel(self, baseForm: dict) -> dict:
        """
        Permite manipular o formulario padrão (baseForm) de modelo de preenchimento para o usuario
        """
        return baseForm


class BasicCost():

    def __init__(self, **kwargs) -> None:
        self.subequipment_id = kwargs.get('subequipment_id')
        self.equipment_id = kwargs.get('equipment_id')
        self.equipment = Equipment.objects.get(id=self.equipment_id)
        if self.subequipment_id is not None:
            self.subequipment = SubEquipment.objects.get(id=self.subequipment_id)

    def getSubequipment(self, subequipment_id):
        return SubEquipment.objects.get(id=subequipment_id)

    # Guides
    def getSubquipmentGuide(self) -> CostMethodsGuide:
        """
        Returns a list of all Pressure Factors (model CostMethodsGuide) related to this equipment. If no equipment was provided,
        it will look for the variable 'equipment' that was setted.
        It will return a QuerySet type
        """
        return CostMethodsGuide.objects.filter(subequipment=self.subequipment).get()

    def checkFields(self, data: dict) -> None:
        self.data = self.basicCheck(data)
        self.data = self.checkPressure(data)

    def listEquipmentPressureFactor(self, subequipment=None) -> QuerySet[PressureFactor]:
        """
        Returns a list of all Pressure Factors related to this equipment.
        """
        if subequipment is None:
            return PressureFactor.objects.filter(subequipment__equipment=self.equipment).all()
        else:
            return PressureFactor.objects.filter(subequipment=subequipment).all()

    def checkPressure(self, data: dict) -> dict:
        erro_message = "Não foi possível fazer a estimativa. "
        guide = self.getSubquipmentGuide()

        if guide.fpressure is False:
            return data
        pname = guide.pressure_field_name if guide.pressure_field_name is not None else "pressure"

        if pname in data.keys():
            data["pressure"] = data[pname]

        if ('pressure' not in data.keys()):
            # ('pressure' not in data.keys() and pname not in data.keys()):
            message = erro_message + "Confira se todos as informações necessárias foram enviadas."
            raise ValueError(message)

        if data["pressure"] == 0:
            data["pressure"] = 0.00001

        pressure_factors = self.listEquipmentPressureFactor(self.subequipment)
        pmax = 0
        pmin = 0
        for pf in pressure_factors:
            pmax = pf.pressure_max if pf.pressure_max > pmax else pmax
            pmin = pf.pressure_min if pf.pressure_min < pmin else pmin
            if data["pressure"] >= pmin and data["pressure"] <= pmax:
                break
        else:
            message = erro_message + f" A pressão deve estar entre {pmax} e {pmin} ."
            raise ValueError(message)

        return data

    def basicCheck(self, data) -> dict:
        erro_message = "Não foi possível fazer a estimativa. "
        dimension = self.equipment.dimension.dimension.dimension.lower()
        se = self.subequipment
        if self.equipment_id != se.equipment.id:
            message = erro_message + "O equipamento " + self.equipment.name + " não possui a opção '" + self.subequipment.description + "' (id:" + str(self.subequipment.id) + "). Favor verificar."
            raise ValueError(message)

        if dimension not in data:
            raise TypeError(f"{erro_message} O campo {dimension} está faltando.")
        data["dimension"] = data[(dimension)]

        if data["dimension"] > se.max_dimension:
            message = erro_message + "O valor informado foi acima do permitido (" + str(se.max_dimension) + self.equipment.dimension.unity + ")"
            raise ValueError(message)
        elif data["dimension"] < se.min_dimension:
            message = erro_message + "O valor informado foi abaixo do permitido (" + str(se.min_dimension) + self.equipment.dimension.unity + ")"
            raise ValueError(message)
        self.data = data
        return data

    # Consulta e retorna as constantes relativas ao custo de compra FOB do equipamento
    def getPurchaseFactor(self, subequipment=None) -> PurchasedFactor:
        """
        Consulta e retorna as constantes relativas ao custo de compra FOB do equipamento
        """
        if subequipment is None:
            return PurchasedFactor.objects.filter(subequipment=self.subequipment).get()
        else:
            return PurchasedFactor.objects.filter(subequipment=subequipment).get()

    def calculateFbm(self, data: dict, isRef: bool) -> float:
        factors = MaterialFactor.objects.filter(subequipment=self.subequipment).get()
        b1 = factors.b1
        b2 = factors.b2
        if isRef is False:
            fm = factors.fm
            fp = self.pressureFactorCalc(self.subequipment, data["pressure"])
        # para condições de ambiente e CS, temos os valores como unidade
        else:
            fm = 1
            fp = 1
        fbm = b1 + (b2 * fm * fp)
        return fbm

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

    def getPressureFactorData(self, pressure, subequipment=None) -> PressureFactor:

        if subequipment is None:
            subequipment = self.subequipment
        pressure_factor = PressureFactor.objects.filter(subequipment_id=subequipment.id, pressure_max__gte=pressure, pressure_min__lte=pressure).all()
        results = pressure_factor.count()
        if results < 1:
            raise ValueError("Valores de pressão incorretos ou não encontrados. Por favor, verifique as especificações.")
        elif results > 1:
            # Resultado exatamente no limiar. Escolhe-se o superior aumentando em 1% a presão
            pressure = pressure + pressure * 0.01
            # chama a si mesmo, com o valor de pressão ajustado
            return self.getPressureFactorData(pressure, subequipment)
        return pressure_factor.get()

    def pressureFactorCalc(self, subequipment: SubEquipment, pressure: float) -> float:

        pf_const = self.getPressureFactorData(pressure)

        # bar -> unidade de calculo [temporario até desbloquear outras unidades]
        conversor = Tools().getUnityConversor(pf_const.unityReference_id)
        pressure = pressure * conversor

        aux1 = pf_const.c1
        aux2 = pf_const.c2 * (math.log10(pressure))
        aux3 = pf_const.c3 * (math.log10(pressure)**2)
        # Equation A.2 from Turton (2018)
        return (10 ** (aux1 + aux2 + aux3))

    def bareModuleCost(self, cost: float, pf: PurchasedFactor, guide: CostMethodsGuide, pressure_factor=1.0) -> float:
        calculate = not guide.fbm
        fbm = self.getFbm(pf, False, calculate)
        return (cost * fbm * pressure_factor)

    def purchaseEquipmentCost(self, base_cost: float, material_factor: float, pressure_factor: float) -> dict:
        return base_cost * material_factor * pressure_factor

    def costEstimative(self):

        # Neste ponto, todas as conversões e alterações devem ter sido finalizadas em checkFields().

        data = self.data
        # Retorna tabela booleana de configuração para calculo do baremodule
        guide = self.getSubquipmentGuide()
        self.guide = guide

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
        self.purchase_equipment_cost = round(self.purchaseEquipmentCost(base_cost, material_factor, pressure_factor), 1)
        # BareModule to material
        self.bare_module_cost = round(self.bareModuleCost(base_cost, pf, guide, pressure_factor), 2)
        # Equipment Cost do equipamento CS
        self.base_equipment_cost = round(base_cost, 2)
        # Bare Module do equipamento CS
        self.base_bare_module_cost = round(base_cost * fbm_ref, 2)
        # Base cost, estimativa inicial -> Para resumo simplificado. Rever necessidade depois
        self.base_cost = round(base_cost, 2)

    def fobEstimate(self, data, pf: PurchasedFactor) -> float:
        """
        Calculo do custo fob pelas equação. Equação A.1, Turton (2018)
        """

        dim = data["dimension"]
        aux1 = pf.k2 * math.log10(dim)
        aux2 = pf.k3 * (math.log10(dim)**2)
        cost = (10 ** (pf.k1 + aux1 + aux2)) * (data["spares"] + 1)
        return cost

    def cepciAdjusting(self, old_cepci, new_cepci) -> float:
        """
        Corrige o preço utilizando a cepci
        """
        inflationTax = new_cepci / old_cepci
        return inflationTax

    def baseCost(self, pf: PurchasedFactor, data: dict) -> float:
        cost = self.fobEstimate(data, pf)
        inflation = self.cepciAdjusting(pf.cepci, data["cepci"])
        return(cost * inflation)

    def exportCosts(self) -> dict:
        return {
            'equipment': self.equipment.name,
            'type': self.subequipment.description,
            'material': self.subequipment.material,
            "purchase_equipment_cost": self.purchase_equipment_cost,
            "bare_module_cost": self.bare_module_cost,
            "base_equipment_cost": self.base_equipment_cost,
            "base_bare_module_cost": self.base_bare_module_cost,
        }
