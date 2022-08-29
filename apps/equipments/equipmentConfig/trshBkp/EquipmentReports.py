from equipments.equipmentConfig.GenericEquipment import GenericEquipment
from equipments.equipmentConfig.SpecialEquipmentCost import SpecialEquipmentCost
from equipments.services.AuxiliarTools import Services
from equipments.services.dev_suport import teste_print
from django.core.exceptions import ObjectDoesNotExist


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
        complements = Services().querySetToDict(self.list_cbm_factors, "subequipment_id")
        sl = self.subequipmentsList
        form = {}
        dimension = self.equipment.dimension.dimension.dimension.lower()
        unity = self.equipment.dimension.unity
        complements = Services().querySetToDict(self.list_cbm_factors, "subequipment_id")
        self.complements = complements
        self.has_pressure = False
        self.has_special = False
        for c in complements.values():
            if c["fpressure"] is True:
                self.has_pressure = True
            if c["specialMethod"] is True:
                self.has_special = True
        if self.has_pressure is True:
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

            if self.has_pressure and bool(pfactor):
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
        if self.has_pressure is True:
            userGuide["pressure"] = "decimal"

        if self.has_special is True:
            userGuide = SpecialEquipmentCost().especialFormSubequiments(self.equipment, userGuide)

        return userGuide

    def costEstimateReport(self, data: dict, id, full_report=False):

        # Padronizando e setando informações
        # Grandeza utilizada
        dimension = self.equipment.dimension.dimension.dimension.lower()

        # definindo o subequipment e conferindo dados recebidos do usuario

        try:
            self.setSubequipment(data["id"])
            self.setCbmProcedure()
            data["dimension"] = data[(dimension)]
            factors = self.cbmSubequipmentListFactors(self.subequipment)
            if factors.pressure_field_name is not None and factors.pressure_field_name in data.keys():
                data["pressure"] = data[factors.pressure_field_name]
            self.checkEstimativeConditions(data, id, factors)
        except ValueError as ve:
            data = {"message": ve.args[0]}
            return self.defaultReponseToUser(422, data)
        except ObjectDoesNotExist as objne:
            data = {"message": "As informações do equipamento não foram localizadas. Favor verificar se o Id foi preenchido corretamente."}
            return self.defaultReponseToUser(422, data)

        # Definindo cabeçalho e corpo da resposta

            # Gera as estimativas
        data = self.generateCostEstimate(data)

        # Define a estrutura de resposta ao usuario
        data = self.generateCostEstimativeReport(data)
        name = self.equipment.name + " - " + self.subequipment.description
        if self.subequipment.material != "N/D":
            name = name + "(" + self.subequipment.material + ")"
        data["equipment"] = name
        status_code = 200

        # Retorno da chamada
        return {
            "status_code": status_code,
            "data": data
        }

    # Define a estrutura de resposta ao usuario
    def generateCostEstimativeReport(self, data: dict) -> dict:
        """
        Define a estrutura de resposta ao usuari
        data-> contem a resposta base com as estimativas
        """
        # retorna o resumo do nome do equipamento, juntamente com subtipo e material, caso tenha.
        name = self.equipment.name + " - " + self.subequipment.description
        if self.subequipment.material != "N/D":
            name = name + "(" + self.subequipment.material + ")"
        data["equipment"] = name

        return data

    def defaultReponseToUser(self, status_code, data):
        return {
            "status_code": status_code,
            "data": data
        }
