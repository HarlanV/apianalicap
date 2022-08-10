from apps.equipments.services.dev_suport import teste_print
from equipments.equipmentConfig.GenericEquipment import GenericEquipment
from equipments.services.EquipmentService import EquipmentService


class Blender (GenericEquipment):

    def __init__(self, id: int, args=None) -> None:
        # Define:
        # equipmentService, equipment, subequipmentsList

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

        # [personalizavel] dimension = medida que define o custo do equipamento. Ex.: volume, area, etc.
        dimension = self.equipment.dimension.dimension.dimension
        unity = self.equipment.dimension.unity
        for se in sl.values():
            form[se["id"]] = {
                # [personalizavel]: Informações a serem enviadas sobre o equipamento para o usuario quando for solicitado.
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
        """
        # [atencao]: caso tenha sido personalizado o campo "dimension" em listAvailableSubequipment() e mapDataToCreate() deve
        # conter o mesmo valor aqui. dimension = titulo do campo que retorna o valor enviado pelo usuario; Ex.:area, volume, etc
        dimension = self.equipment.dimension.dimension.dimension
        return {
            "data": {
                # [personalizavel]: informações necessárias para ser feio o orçamento. Será enviado ao usuário como orientação.
                # "nome_do_campo": "tipo de dado aceito" -> Seguir este padrão
                "id": "int",
                str(dimension): "decimal",
                "spares": "int",
                "cepci": "int (alterar pra plant/unity)",
                "create": "boolean",
            }
        }

    def formatedEstimative(self, data, equipment_id):

        # [atencao]: caso tenha sido personalizado o campo "dimension" em listAvailableSubequipment() e mapDataToCreate() deve
        # conter o mesmo valor aqui. dimension = titulo do campo que retorna o valor enviado pelo usuario; Ex.:area, volume, etc
        dimension = self.equipment.dimension.dimension.dimension.lower()

        self.hasCostCorrections()

        dimension_value = data[(dimension)]
        data["dimension"] = dimension_value
        check = self.checkEstimativeConditions(data, equipment_id)
        if check["checked"] is True:
            data = self.generateCostEstimate(data, full_report=True)
            name = self.equipment.name + " - " + self.subequipment.description
            if self.subequipment.material != "N/D":
                name = name + "(" + self.subequipment.material + ")"
            data["equipment"] = name
            status_code = 200
        else:
            status_code = 400
            data = {"message": check["message"]}

        return {
            "status_code": status_code,
            "data": data
        }

    def hasCostCorrections(self):
        super().hasCostCorrections()
