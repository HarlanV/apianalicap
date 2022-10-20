
import json
from django.forms.models import model_to_dict
from equipments.services.dev_suport import teste_print
from equipments.models import PhysicalUnit
from django.core.serializers.json import DjangoJSONEncoder


class EquipmentTools():

    def __init__(self) -> None:
        pass

    def querySetToDict(self, qs, id="id") -> dict:
        """
        Função auxiliar para converter um QuerySet em dicionario
        obs: Não sendo utilizada no momento
        """
        var = {}
        for q in qs.values():
            var[q[id]] = dict(q)
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
