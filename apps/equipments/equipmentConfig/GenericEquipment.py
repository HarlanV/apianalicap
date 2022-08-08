from equipments.services.EquipmentService import EquipmentService
from equipments.services.dev_suport import teste_print


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