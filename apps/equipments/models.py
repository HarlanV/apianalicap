from django.db import models
import math


# Lista de dimensões físicas (Area, Volumen, etc)
class Dimension(models.Model):
    dimension = models.CharField(max_length=300, null=True)
    symbol = models.CharField(max_length=300, null=True)

    def __str__(self):
        return self.dimension

    class Meta:
        db_table = "dimension"


# Lista de unidades e conversões conhecidas
class PhysicalUnit(models.Model):
    """
    Model with all physical units and their converters
    """
    dimension = models.ForeignKey(Dimension, on_delete=models.CASCADE)
    unity = models.CharField(max_length=300, null=True)
    unity_math = models.CharField(max_length=300, null=True)
    convert_factor = models.FloatField(null=True, blank=True)
    is_default = models.BooleanField(null=True, blank=True)

    def __str__(self):
        return self.unity

    class Meta:
        db_table = "physical_unit"


# Cadastro raiz de equipamentos e caracteristicas relevantes basicas
class Equipment(models.Model):
    """
    Model with Equipments Model
    """
    name = models.CharField(max_length=300)
    dimension = models.ForeignKey(PhysicalUnit, on_delete=models.CASCADE)
    symbol = models.CharField(max_length=10, null=True, blank=True)
    utility_form = models.CharField(max_length=30, null=True, blank=True)
    active = models.BooleanField(default=True, null=True, blank=True)
    num_of_subequipments = models.IntegerField(blank=True, null=True)

    def __str__(self):
        return self.name

    class Meta:
        db_table = "equipment"


# Sub-características de equipamentos
class SubEquipment(models.Model):
    material = models.CharField(max_length=100, null=True)
    description = models.CharField(max_length=100, null=True)
    max_dimension = models.FloatField(null=True)
    min_dimension = models.FloatField(null=True)
    equipment = models.ForeignKey(Equipment, on_delete=models.CASCADE)
    isSolid = models.BooleanField(default=True, null=True, blank=True)

    class Meta:
        db_table = "sub_equipment"

    def __str__(self):
        return str(self.description + "(" + self.material + ")")


# Informações de compras para estimativa do preço base de compra
class PurchasedFactor(models.Model):
    """
    Fatores de compra do preço base junto com respectiva CEPCI
    """
    k1 = models.FloatField(null=True)
    k2 = models.FloatField(null=True)
    k3 = models.FloatField(null=True)
    fixed_value = models.FloatField(null=True)
    subequipment = models.ForeignKey(SubEquipment, on_delete=models.CASCADE)
    reference_year = models.IntegerField(blank=True, null=True)
    is_reference = models.BooleanField(default=0, blank=True)
    cepci = models.FloatField(null=True, blank=True)

    class Meta:
        db_table = "purchase_factor"

    def __str__(self):
        return str(self.description + "(" + self.material + ")")


# Informações para correção de preço devido a pressão
class PressureFactor(models.Model):
    """
    Fatores relevantes para correção da pressão no preço de custo
    """
    c1 = models.FloatField(null=True)
    c2 = models.FloatField(null=True)
    c3 = models.FloatField(null=True)
    pressure_min = models.FloatField(null=True)
    pressure_max = models.FloatField(null=True)
    condition = models.CharField(max_length=300, null=True)
    subequipment = models.ForeignKey(SubEquipment, on_delete=models.CASCADE)

    class Meta:
        db_table = "pressure_factor"


# Informações para correção de preço devido ao meterial
class MaterialFactor(models.Model):
    b1 = models.FloatField(null=True)
    b2 = models.FloatField(null=True)
    fm = models.FloatField(null=True)
    condition = models.CharField(max_length=300, null=True, blank=True)
    subequipment = models.ForeignKey(SubEquipment, on_delete=models.CASCADE)

    class Meta:
        db_table = "material_factor"


# Fator de conversão de modulo vazio fbm
class BareModule(models.Model):
    fbm = models.FloatField(null=True)
    calculated = models.BooleanField(null=True)
    subequipment = models.ForeignKey(SubEquipment, on_delete=models.CASCADE)

    def __str__(self):
        return str(self.fbm)

    class Meta:
        db_table = "baremodule_factor"


# Constantes complementares e auxiliares de equipamentos
class ComplementConstants(models.Model):
    constant = models.CharField(max_length=300, null=True)
    value = models.FloatField(null=True)
    description = models.CharField(max_length=300, null=True)
    subequipment = models.ForeignKey(SubEquipment, on_delete=models.CASCADE)

    def __str__(self):
        return self.constant

    class Meta:
        db_table = "equipment_complement_constants"


class BaseEquipment():

    def __init__(self):
        return

    # Retona as constante de custo do equipamento
    def getEquipmentById(self, id):
        self.equipment = Equipment.objects.get(id=id)
        return self.equipment

    # Função para calculo do valor de compra pela função logarítimica
    def baseCostCalculate(self, E: float):
        """
        Função recebe um valor de especificação E (área, volume, etc) e calcula
        o custo de compra básico (sem B.M.)
        Obs: obrigatorio ter passado por 'define_purchase_constants()'
        """
        aux1 = self.k2 * math.log10(E)
        aux2 = self.k3 * (math.log10(E)**2)
        price = (10 ** (self.k1 + aux1 + aux2)) * (self.spares + 1)
        self.baseCost = price
        return price

    # Seta as variáveis para calculo do custo de compra
    def define_purchase_constants(self, type, constants):
        """
        Função para setar dentro da classe as constantes de compra depois de pesquisada
        """
        self.k1 = constants.k1
        self.k2 = constants.k2
        self.k3 = constants.k3
        self.maxAttribute = constants.max_dimension
        self.minAttribute = constants.min_dimension
        self.type = type
        self.reference_cepci = constants.cepci
        self.purchase_id = constants.id
        self.purchase_obj = constants

    # Função auxiliar para arredondamento de valor significativo. Regra de capex no CAPCOST {encapsular}
    def upRound(self, value):
        """
        função auxiliar aproxima value para o mais proximo do multiplo de (10^digits)
        """
        rounded = round(value)
        if (rounded < 1):
            digits = -3
        else:
            digits = -(3 - len(str(round(value))))

        rounded = (round((value / (10**digits))) * (10**digits))
        return rounded

    # [ok] Retornas os custos do Bare Module
    def get_equipment_price(self):
        """
        Função retorna um dicionário com os custos calculo Bare Module
        """
        prices = {
            'Base Coast': round(self.baseCost),
            'Bare Module Cost': round(self.bareModule)
        }
        return prices

    # Função retorna/calcula o Fbm
    def bareModuleFactor(self, isConstant=True, equipmentId=0):
        if isConstant is True:
            fbm = BareModule.objects.filter(equipment_id=self.purchase_id).first().fbm
        else:
            fbm = self.roughFbm(equipmentId)
        return fbm

    # Calcula o fbm pela definição
    def roughFbm(self, equip_id):
        materialFactors = MaterialFactor.objects.filter(equipment_id=equip_id).first()
        self.materialFactors = materialFactors
        fbm = (materialFactors.b1 + (materialFactors.b2 * materialFactors.fm * self.pressureFactor))
        return fbm

    def baseRoughFbm(self):
        b1 = self.b1
        b2 = self.b2
        fM = 1
        fP = 1
        fbm = (b1 + (b2 * fM * fP))
        return fbm

    # [ok] Calculo do fator de pressão
    def pressureFactorCalc(self, pressure):
        const = PressureFactor.objects.filter(equipment=self.purchase_id).first()
        aux1 = const.c1
        aux2 = const.c2 * (math.log10(pressure))
        aux3 = const.c3 * (math.log10(pressure)**2)
        pressureFactor = 10 ** (aux1 + aux2 + aux3)

        return pressureFactor

    # [ok] Insere os dados já calculados no projeto
    def insertIntoProject(self, project):
        args = {
            'purchased_factor': self.purchase_obj,
            'equipment_code': self.findsEquipmentCode(project.projectNum),
            'purchased_equip_cost': self.purchasedEquipmentCost,
            'baremodule_cost': self.bareModuleCost,
            'base_equipment_cost': self.baseEquipmentCost,
            'base_baremodule_cost': self.baseBaremoduleCost,
            'equipment': self.equipment,
            'spares': self.spares,
            'specification': self.specification,
            'preference_unity': self.selectedUnity
        }

        # Nem todos os equipamentos possuem pressão. Campo nulable
        try:
            if self.pressure is not None:
                args["pressure"] = self.pressure
                args["pressureunity"] = self.pressureUnity
        except AttributeError:
            pass

        equipment = project.insertEquipment(args)

        project.updateCosts()

        # configura os gastos de utilidades do equipamento. Deve ser sobrescrito na instância do equipamento
        self.setUtilitiesField(equipment, project)
        # equipment

        return equipment

    # [ok] Atualiza os dados já calculados no projeto
    def updateInProject(self, project, equipmentProject):

        # equipment code não é alterável (Regra de negócio até o momento)
        args = {
            'purchased_factor': self.purchase_obj,
            'equipment_code': equipmentProject.equipment_code,
            'purchased_equip_cost': self.purchasedEquipmentCost,
            'baremodule_cost': self.bareModuleCost,
            'base_equipment_cost': self.baseEquipmentCost,
            'base_baremodule_cost': self.baseBaremoduleCost,
            'equipment': self.equipment,
            'spares': self.spares,
            'specification': self.specification,
            'preference_unity': self.selectedUnity
        }

        try:
            if self.pressure is not None:
                args["pressure"] = self.pressure
                args["pressureunity"] = self.pressureUnity
        except AttributeError:
            pass

        equipment = project.updateEquipment(args, equipmentProject)
        equipment = project.updateCosts()
        return equipment

    # [ok] Função auxiliar para criar o código de Projeto do Equipamento {encapsular}
    def findsEquipmentCode(self, numProject):
        equipmentLetter = self.equipment.symbol
        initial = equipmentLetter + (str(numProject)[:1])
        query = EquipmentProject.objects.filter(equipment_code__contains=initial)
        code = equipmentLetter + str(numProject + query.count() + 1)
        return code

    def setUtilitiesField(self, equipment=None, projec=None):
        pass