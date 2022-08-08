from equipments.services.EquipmentService import EquipmentService
from equipments.services.dev_suport import teste_print
from equipments.equipmentConfig.GenericEquipment import GenericEquipment


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
        return {
            "id": "int",
            "volume": "decimal",
        }

    def getFobCost(self) -> dict:
        teste_print("chegou aqui!!")

        return{"custo": 2000.00}
