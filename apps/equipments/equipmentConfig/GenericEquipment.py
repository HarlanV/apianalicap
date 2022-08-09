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
            self.has_cost_corrections = False
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

    def generateCostEstimate(self, data, full_report=False):
        self.calculateCosts(data)
        if full_report is False:
            return {
                "estimative": {
                    "Base Cost": self.base_cost,
                    "Bare Module Cost": self.bare_module_cost
                }
            }
        else:
            return {
                "estimative": {
                    "Purchase Equipment Cost": self.purchase_equipment_cost,
                    "Bare Module Cost": self.bare_module_cost,
                    "Base Equipment Cost": self.base_equipment_cost,
                    "Base Bare Module Cost": self.base_bare_module_cost
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

    def checkEstimativeConditions(self, data, equipment_id) -> dict:
        # constants = PurchasedFactor.objects.filter(equipment_id=id, description=type).first()
        se = self.equipmentService.getSubEquipment(data["id"])
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

    def hasCostCorrections(self):
        """
        Setar uma lista de correções que devem ser aplicadas.
        """
        self.has_cost_corrections = True
        self.list_cost_corrections = {
            "material": False,
            "pressure": False,
            'specific_procedure': False
        }

    def calculateCosts(self, data: dict):

        pf = self.queryPurchaseBySubEquip(self.subequipment)
        fob = self.fobEstimate(data, pf)
        base_cost = round(self.baseCost(fob, pf, data), 2)

        lc = self.list_cost_corrections

        if lc["material"] is True:
            sub_ref = self.equipmentService.getSubEquipment(pf.reference_material_id)
            pf_ref = self.queryPurchaseBySubEquip(sub_ref)
            # Base cost, estimativa inicial
            self.base_cost = base_cost
            # Preço fob corrigido pelo material
            self.purchase_equipment_cost = round((base_cost * (pf.fbm / pf_ref.fbm)), 2)
            # BareModule to material
            self.bare_module_cost = round(self.bareModuleCost(base_cost, pf), 2)
            # Equipment Cost do equipamento CS
            self.base_equipment_cost = round(base_cost, 2)
            # Bare Module do equipamento CS
            self.base_bare_module_cost = round(base_cost * pf_ref.fbm, 2)
        elif lc["pressure"] is True:
            pass
        elif lc["specific_procedure"] is True:
            self.specificCalculateCost(self, data)

        else:
            self.base_cost = base_cost
            self.purchase_equipment_cost = base_cost
            self.bare_module_cost = round(self.bareModuleCost(base_cost, pf), 2)
            self.base_equipment_cost = base_cost
            self.base_bare_module_cost = self.bare_module_cost

    def specificCalculateCost(self, data):
        # importar aqui depois todos os dados de todas as tabelas desse equipamento
        self.purchase_factor = self.queryPurchaseBySubEquip(self.subequipment)
        # self.material_factor = 0
        # self.complement_constant = 0
        # data
        # base_cost = round(self.baseCost(fob, pf, data), 2)
        pass
