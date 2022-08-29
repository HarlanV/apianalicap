from equipments.models import PurchasedFactor, PressureFactor, SubEquipment, Equipment, CostMethodsGuide, MaterialFactor
from equipments.services.dev_suport import teste_print
from equipments.equipmentConfig.BaseEquipment import BaseEquipment
from equipments.services.AuxiliarTools import Services
from equipments.equipmentConfig.SpecialEquipment import SpecialEquipmentCost, SpecialEquipmentForm


class BaseEquipmentForm(BaseEquipment):

    def __init__(self, id) -> None:
        self.id = id
        self.setEquipment(id)
        self.equipment = self.getEquipment()
        self.name = self.equipment.name.title().replace("-", "").replace(" ", "")
        self.subequipmentsList = self.listSubequipmentByEquipment(id)
        self.purchase_equipment_cost = 0
        self.bare_module_cost = 0
        self.base_equipment_cost = 0
        self.base_bare_module_cost = 0

    def listAvailableSubequipment(self) -> dict:
        """
        Cria um dict com informações nescessárias para orçamento de cada subequipment, para exportar
        """
        equipmentGuides = self.listEquipmentMethodsGuide()
        guide = Services().querySetToDict(equipmentGuides, "subequipment_id")

        self.has_pressure = False
        self.has_special = False
        form = {}
        qsetPressure = self.listEquipmentPressureFactor()
        pfactor = None
        if bool(qsetPressure):
            pfactor = Services().querySetToDict(qsetPressure, "subequipment_id")

        for sb in self.subequipmentsList:
            form[sb.id] = self.detailSubequipment(sb, guide, pfactor)

        return form

    def detailSubequipment(self, subequipment: SubEquipment, guide: dict, pfactor) -> dict:
        guide = guide[subequipment.id]
        detail = {}
        if self.equipment.hasSpecial is True:
            auxiliar = BaseEquipmentForm(self.id)
            detail = SpecialEquipmentForm(self.equipment, auxiliar).getDescription(subequipment, guide, pfactor)
        else:
            detail = self.generalSubequipmentDetail(subequipment, guide, pfactor)
            pass

        return detail

    def generalSubequipmentDetail(self, subequipment: SubEquipment, guide: dict, pfactor) -> dict:
        equipment = self.getEquipment()
        dimension = equipment.dimension.dimension.dimension.lower()
        unity = self.equipment.dimension.unity

        subequipment = Services().modelToDict(subequipment)
        form = {
            'id': subequipment["id"],
            'subtype': subequipment["description"],
            (dimension + ' max'): subequipment["max_dimension"],
            (dimension + ' min'): subequipment["min_dimension"],
            (dimension + ' unity'): unity,
        }

        if guide["material_correction"] is True:
            form["material"] = subequipment["material"]

        if guide["fpressure"] is True and bool(pfactor):
            pName = guide["pressure_field_name"]
            form["max_" + pName] = pfactor[subequipment["id"]]["pressure_max"]
            form["min_" + pName] = pfactor[subequipment["id"]]["pressure_min"]

        return form

    def mapDataToCreate(self) -> dict:
        """
        Retorna uma modelo de como deve ser enviado a informação para realizar orçamento do equipamento.
        {
            nome_do_campo:"tipo de informação"
        }
        """
        dimension = self.equipment.dimension.dimension.dimension.lower()
        userGuide = {
            "id": "int",
            dimension: "decimal",
        }

        qsetPressure = self.listEquipmentPressureFactor()
        if bool(qsetPressure):
            qsetPressure = self.listEquipmentPressureFactor()
            userGuide["pressure"] = "decimal"

        if self.equipment.hasSpecial is True:
            qsetPressure = self.listEquipmentPressureFactor()
            guide = self.listEquipmentMethodsGuide()

            newFields = SpecialEquipmentForm(self.equipment, BaseEquipmentForm(self.id)).getDescription(self.equipment, guide)
            userGuide.update(newFields)

        return userGuide

    def exportCosts(self) -> dict:
        return {
            "purchase_equipment_cost": self.purchase_equipment_cost,
            "bare_module_cost": self.bare_module_cost,
            "base_equipment_cost": self.base_equipment_cost,
            "base_bare_module_cost": self.base_bare_module_cost,
        }
