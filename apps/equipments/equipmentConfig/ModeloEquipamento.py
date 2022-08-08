from equipments.services.EquipmentService import EquipmentService
from equipments.services.dev_suport import teste_print
from equipmentConfig.GenericEquipment import GenericEquipment


class ModeloEquipamento(GenericEquipment):
    def __init__(self, id: int, args=None) -> None:
        """
        Caso args seja nescessário, deve ser do tipo dict
        """
        if args is None:
            # Define:
            # equipmentService, equipment, subequipmentsList
            super().__init__(id)
        else:
            # Define:
            # equipmentService, equipment, subequipmentsList
            super().__init__(id, args)
        pass

    def listAvailableSubequipment(self) -> dict:
        """
        Cria um dict com informações nescessárias para orçamento de cada subequipment, para exportar
        """
        sl = self.subequipmentsList
        form = {}
        dimension = self.equipment.dimension.dimension.dimension
        for se in sl.values():
            form[se["id"]] = {
                'id': se["id"],
                'subtype': se["description"],
                'material': se["material"],
                (dimension + ' max'): se["max_dimension"],
                (dimension + ' min'): se["min_dimension"],
            }
        return form

    
