from equipments.equipmentConfig.EquipmentCost import EquipmentCost
from equipments.services.AuxiliarTools import Services
from equipments.services.dev_suport import teste_print
from django.core.exceptions import ObjectDoesNotExist


class EquipmentReports(EquipmentCost):

    def __init__(self, id: int, args=None) -> None:

        if args is None:
            super().__init__(id)
        else:
            super().__init__(id, args)
        self.id = id

    def setBaseEstimativeVars(self, data: dict) -> None:
        super().setBaseEstimativeVars(data)

    def getEquipmentForm(self) -> dict:
        """
        Retorna uma lista especificações de subequipamentos e um modelo de como deve ser feito a estimativa
        """
        subList = self.listAvailableSubequipment()
        form = self.mapDataToCreate()
        return {
            "available": subList,
            "model": form
        }

    def costEstimateReport(self, data: dict, id, full_report=False):

        # Padronizando e setando informações
        # Grandeza utilizada
        dimension = self.equipment.dimension.dimension.dimension.lower()

        # definindo o subequipment e conferindo dados recebidos do usuario

        try:
            self.setBaseEstimativeVars(data)

            data["dimension"] = data[(dimension)]        
            guide = self.getSubequipmentMethodsGuide()
            if guide.pressure_field_name is not None and guide.pressure_field_name in data.keys():
                data["pressure"] = data[guide.pressure_field_name]

            self.checkEstimativeConditions(data, id, guide)

        except ValueError as ve:
            data = {"message": ve.args[0]}
            return self.defaultReponseToUser(422, data)
        except ObjectDoesNotExist as objne:
            data = {"message": "As informações do equipamento não foram localizadas. Favor verificar se o Id foi preenchido corretamente."}
            return self.defaultReponseToUser(422, data)

        # Definindo cabeçalho e corpo da resposta

        # Gera as estimativas
        data = self.costEstimative(data)

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
