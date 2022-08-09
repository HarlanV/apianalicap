from equipments.models import PurchasedFactor
from equipments.services.EquipmentService import EquipmentService
from equipments.services.dev_suport import teste_print
import math


class GenericEquipment():
    def __init__(self, id=None) -> None:
        if id is not None:
            self.equipmentService = EquipmentService()
            self.equipment = self.equipmentService.getEquipmentById(id)
            self.subequipmentsList = self.equipmentService.subEquipmentsFromEquipment(id)
        else:
            pass

    def listAvailableSubequipment(self) -> dict:
        """
        Cria um dict com informações nescessárias para orçamento de cada subequipment, para exportar
        """
        sl = self.subequipmentsList
        form = {}
        dimension = self.equipment.dimension.dimension.dimension
        unity = self.equipment.dimension.unity
        teste_print(unity)
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

    def previewCostEstimate(self, data):
        pf = self.queryPurchaseBySubEquip(self.subequipment)
        fob = self.fobEstimate(data, pf)
        base_cost = round(self.baseCost(fob, pf, data), 2)
        bare_module_cost = round(self.bareModuleCost(base_cost, pf), 2)

        return {
            "estimative": {
                "Base Cost": base_cost,
                "Bare Module Cost": bare_module_cost
            }
        }

    def completeCostEstimate(self, data):

        pf = self.queryPurchaseBySubEquip(self.subequipment)
        fob = self.fobEstimate(data, pf)
        base_cost = round(self.baseCost(fob, pf, data), 2)
        # calculo final
        purchase_equipment_cost = base_cost
        bare_module_cost = round(self.bareModuleCost(base_cost, pf), 2)
        base_equipment_cost = base_cost
        base_bare_module_cost = bare_module_cost

        return {
            "estimative": {
                "Purchase Equipment Cost": purchase_equipment_cost,
                "Bare Module Cost": bare_module_cost,
                "Base Equipment Cost": base_equipment_cost,
                "Base Bare Module Cost": base_bare_module_cost
            }
        }

    def fobEstimate(self, data, pf=None):
        if pf is None:
            pf = self.queryPurchaseBySubEquip(self.subequipment)
        di = data["dimension"]
        aux1 = pf.k2 * math.log10(di)
        aux2 = pf.k3 * (math.log10(di)**2)
        cost = (10 ** (pf.k1 + aux1 + aux2)) * (data["spares"] + 1)
        return cost

    def queryPurchaseBySubEquip(self, subequipment):
        """
        Consulta e retorna as constantes relativas ao custo de compra FOB do equipamento
        """
        return PurchasedFactor.objects.filter(subequipment=subequipment).get()

    def checkEstimativeConditions(self, data) -> dict:
        # constants = PurchasedFactor.objects.filter(equipment_id=id, description=type).first()
        se = self.equipmentService.getSubEquipment(data["id"])
        self.subequipment = se
        # dimension = data[(self.equipment.dimension.dimension.dimension.lower())]
        if data["dimension"] > se.max_dimension:
            return{
                "checked": False,
                "message": "Não foi possível fazer a estimativa. O valor informado foi acima do permitido (" + str(se.max_dimension) + self.equipment.dimension.unity + ")"
            }
        elif data["dimension"] < se.min_dimension:
            return{
                "checked": False,
                "message": "Não foi possível fazer a estimativa. O valor informado foi abaixo do permitido (" + str(se.min_dimension) + self.equipment.dimension.unity + ")"
            }
        else:
            return{
                "checked": True,
                "message": None
            }

    def baseCost(self, cost: float, pf: PurchasedFactor, data: dict) -> float:
        old_cepci = pf.cepci
        new_cepci = data["cepci"]
        return ((cost * new_cepci) / old_cepci)

    def bareModuleCost(self, cost: float, pf: PurchasedFactor) -> float:
        return (cost * pf.fbm)
