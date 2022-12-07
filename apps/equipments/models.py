from django.db import models
from equipments.services.dev_suport import teste_print
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
    usable = models.BooleanField(default=True, null=True, blank=True)
    num_of_subequipments = models.IntegerField(blank=True, null=True)
    hasSpecial = models.BooleanField(default=False, null=True, blank=True)

    def __str__(self):
        return self.name

    def subequipments(equipment_id):
        return SubEquipment.objects.filter(equipment=equipment_id)

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
    # temporaryTracker = models.IntegerField(null=True, blank=True)
    # materialTracker = models.IntegerField(null=True, blank=True)

    class Meta:
        db_table = "subequipment"

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
    fbm = models.FloatField(null=True, blank=True)
    reference_year = models.IntegerField(blank=True, null=True)
    is_reference = models.BooleanField(default=0, blank=True)
    reference_material_id = models.IntegerField(default=0, blank=True)
    cepci = models.FloatField(null=True, blank=True)

    class Meta:
        db_table = "purchase_factor"

    def __str__(self):
        return str(self.subequipment.description + "(" + str(self.subequipment.material) + ")")


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
    unityReference = models.ForeignKey(PhysicalUnit, on_delete=models.CASCADE, default=12)

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


class CostMethodsGuide(models.Model):
    fbm = models.BooleanField(null=True)
    fpressure = models.BooleanField(null=True)
    material_correction = models.BooleanField(null=True)
    specialMethod = models.BooleanField(null=True)
    subequipment = models.ForeignKey(SubEquipment, on_delete=models.CASCADE)
    material_field_name = models.CharField(max_length=100, null=True)
    pressure_field_name = models.CharField(max_length=100, null=True)
    special_function_name = models.CharField(max_length=100, null=True)

    def __str__(self):
        return str(self.subequipment) + " method_guide"

    class Meta:
        db_table = "cost_factors_guide"


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


