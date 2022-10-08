
# Criação de Equipamento

## Criando Configuração e Modelagem
1 - Duplicar o arquivo "ModeloEquipamento" dentro da pasta equipmentConfig.

2 - Renomear o nome do arquivo e da classe para bater com o nome do equipamento. O nome deve bater com o que foi salvo no banco de dados, com a primeira letra de cada palavra em maiusculo/caixa-alta, conforme foi salvo o original (ModeloEquipamento)

3 - Verificar os campos escrtitos [personalizavel] e [atenção].

Deve ser criado um arquivo chamado [NomeDoEquipamento].py dentro da pasta app/equipments/equipmentConfig. Deve ser usado camelCase, com a primeira letra em maiusculo, semelhante  aos modelos já criados.

## Instalação em ambiente Windows
1 - Criar o ambiente virtual
  > python -m venv [nome do seu ambiente virtual]
2 - Ativar o ambiente virtual 
  > $pathDoArquivo/[seu ambiente]/Scripts/Activate.ps1
3 - Instalar as dependencias

4 - Configurar as variáveis de ambiente
5 - Rodas as migrations
6 - Inserir os dados no banco de dados