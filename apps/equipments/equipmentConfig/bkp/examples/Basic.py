from ast import Return
from equipments.models import PurchasedFactor, PressureFactor, SubEquipment, Equipment, CostMethodsGuide, MaterialFactor
from equipments.services.AuxiliarTools import Services
from equipments.services.dev_suport import teste_print
from django.db.models.query import QuerySet
import math


class BaseEquipment():
    """
    This Class has the basics functions and attributes of an Equipment, without any estimating cost function
    """
    def __init__(self) -> None:
        pass

    # Set an equipment inside this class, withour returns it
    def setEquipment(self, id: int) -> None:
        """
        Set an equipment inside this class, withour returns it
        """
        self.equipment = Equipment.objects.get(id=id)
