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

    def fobEstimate(self, data):

        pf = self.queryPurchaseBySubEquip(self.subequipment)
        Di = data["dimension"]

        aux1 = pf.k2 * math.log10(Di)
        aux2 = pf.k3 * (math.log10(Di)**2)
        cost = (10 ** (pf.k1 + aux1 + aux2)) * (data["spares"] + 1)
        # self.baseCost = price
        # return price

        # teste_print(self.subequipment)
        # constants = PurchasedFactor.objects.filter(equipment_id=id, description=type).first()
        # self.set_purchase_constants(type, constants)
        # self.k1 = constants.k1

        return {
            "estimative": {
                "custo 1": cost,
                "Custo 2": 456
            }
        }

    def queryPurchaseBySubEquip(self, subequipment):
        return PurchasedFactor.objects.filter(subequipment=subequipment).get()
        teste = pf.k1
        teste_print(teste)
        return teste

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
