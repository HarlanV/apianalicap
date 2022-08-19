from equipments.equipmentConfig.GenericEquipment import GenericEquipment
from equipments.models import EspecialEquipmentsMethods
from equipments.services.AuxiliarTools import Services
from equipments.services.dev_suport import teste_print


class EquipmentReports(GenericEquipment):
    def __init__(self, id: int, args=None) -> None:

        if args is None:
            super().__init__(id)
        else:
            super().__init__(id, args)
        pass

    def listAvailableSubequipment(self) -> dict:
        """
        Cria um dict com informações nescessárias para orçamento de cada subequipment, para exportar
        """
        sl = self.subequipmentsList
        form = {}
        dimension = self.equipment.dimension.dimension.dimension.lower()
        unity = self.equipment.dimension.unity
        complements = Services().querySetToDict(self.list_cbm_factors, "subequipment_id")
        self.complements = complements
        self.hasPressure = False
        self.hasSpecial = False
        for c in complements.values():
            if c["fpressure"] is True:
                self.hasPressure = True
            if c["specialMethod"] is True:
                self.hasSpecial = True
        if self.hasPressure is True:
            qsetPressure = self.getEquipmentPressureFactor()
            pfactor = Services().querySetToDict(qsetPressure, "subequipment_id")

        for se in sl.values():
            form[se["id"]] = {
                'id': se["id"],
                'subtype': se["description"],
                (dimension + ' max'): se["max_dimension"],
                (dimension + ' min'): se["min_dimension"],
                (dimension + ' unity'): unity,
            }
            if complements[se["id"]]["material_correction"] is True:
                form[se["id"]]["material"] = se["material"]

            if self.hasPressure:
                pName = complements[se["id"]]["pressure_field_name"]
                form[se["id"]]["max_" + pName] = pfactor[se["id"]]["pressure_max"]
                form[se["id"]]["min_" + pName] = pfactor[se["id"]]["pressure_min"]

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
        if self.hasPressure is True:
            userGuide["pressure"] = "decimal"

        if self.hasSpecial is True:
            userGuide = EspecialEquipmentsMethods().especialFormSubequiments(self.equipment, userGuide)

        return userGuide

    def costEstimateReport(self, data: dict, id, full_report=False):

        # Padronizando e setando informações
        # Grandeza utilizada
        dimension = self.equipment.dimension.dimension.dimension.lower()

        # definindo o subequipment e conferindo dados recebidos do usuario
        self.setSubequipment(data["id"])
        self.setCbmProcedure()
        data["dimension"] = data[(dimension)]
        factors = self.cbmSubequipmentListFactors(self.subequipment)
        if factors.pressure_field_name is not None and factors.pressure_field_name in data.keys():
            data["pressure"] = data[factors.pressure_field_name]

        check = self.checkEstimativeConditions(data, id, factors)

        # Definindo cabeçalho e corpo da resposta
        if check["checked"] is True:
            # Gera as estimativas
            self.generateCostEstimate(data, full_report=True)

            # Define a estrutura de resposta ao usuario
            data = self.generateCostEstimativeReport(True)
            name = self.equipment.name + " - " + self.subequipment.description
            if self.subequipment.material != "N/D":
                name = name + "(" + self.subequipment.material + ")"
            data["equipment"] = name
            status_code = 200
        else:
            status_code = 400
            data = {"message": check["message"]}

        # Retorno da chamada
        return {
            "status_code": status_code,
            "data": data
        }

    def generateCostEstimativeReport(self, full_report=True):
        if full_report is False:
            estimative = {
                "Base Cost": self.base_cost,
                "Bare Module Cost": self.bare_module_cost
            }
        else:
            estimative = {
                "Purchase Equipment Cost": self.purchase_equipment_cost,
                "Bare Module Cost": self.bare_module_cost,
                "Base Equipment Cost": self.base_equipment_cost,
                "Base Bare Module Cost": self.base_bare_module_cost
            }

        return estimative
