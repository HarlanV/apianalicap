import json
from django.forms.models import model_to_dict
from equipments.services.dev_suport import teste_print
from equipments.models import PhysicalUnit
from django.core.serializers.json import DjangoJSONEncoder
from django.db.models.query import QuerySet


class Tools():

    def __init__(self) -> None:
        pass

    def querySetToDict(self, qs: QuerySet, dict_id: str = "id") -> dict:
        """
        Função auxiliar para converter um QuerySet em dicionario
        obs: Não sendo utilizada no momento
        """
        var = {}
        for q in qs.values():
            var[q[dict_id]] = dict(q)
        return var

    def querysetSerialize(self, data) -> str:
        """
        Recebe um queryset e converte em json
        """
        return json.dumps(list(data.values()), cls=DjangoJSONEncoder)

    def modelSerialize(self, data) -> str:
        """
        Recebe os dados de uma model e converte em json
        """
        var = model_to_dict(data)
        return json.dumps(var)

    def modelToDict(self, data):
        return model_to_dict(data)

    def sampleDictSerialize(self, data):
        return json.dumps(data)

    def getUnityConversor(self, id):
        return PhysicalUnit.objects.get(id=id).convert_factor


class AppErrorMessages():

    def __init__(self, chooseLanguage="EN") -> None:

        languages = {
            "EN": 1,
            "PT-BR": 2
        }

        self.language = languages[chooseLanguage]

    def estimative(self):
        erro_message = "Não foi possível fazer a estimativa. "
        return erro_message

        if equipment_id != self.subequipment.equipment.id:
            message = erro_message + "O equipamento " + self.equipment.name + " não possui a opção '" + self.subequipment.description + "' (id:" + str(self.subequipment.id) + "). Favor verificar."
            raise ValueError(message)

        elif data["dimension"] > se.max_dimension:
            message = erro_message + "O valor informado foi acima do permitido (" + str(se.max_dimension) + self.equipment.dimension.unity + ")"
            raise ValueError(message)

        elif data["dimension"] < se.min_dimension:
            message = erro_message + "O valor informado foi abaixo do permitido (" + str(se.min_dimension) + self.equipment.dimension.unity + ")"
            raise ValueError(message)
        elif 'pressure' not in data.keys() and self.hasPressure() is True:
            message = erro_message + "Confira se todos as informações necessárias foram enviadas."