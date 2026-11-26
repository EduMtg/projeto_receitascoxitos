# Projeto App de Receitas - Coxitos
## Descrição:
Coxitos é um aplicativo mobile de receitas desenvolvido em Flutter. Os dados são fornecidos pela 
API DummyJSON Recipes, no app é possível buscar receitas pelo seu nome, ver ingredientes e modo de 
preparo, além de possibilitar o usuário a salvar suas receitas favoritas.

## Funcionalidades:
+ Lista de receitas carregada da API ao abrir o app, com nome e imagem.
+ Pesquisa por nome, com botão Limpar para voltar à lista.
+ Detalhes da receita com ingredientes e modo de preparo.
+ Adicionar e remover receitas favoritadas, sem duplicatas.
+ Indicador de carregamento e mensagens de erro.
+ Mensagens para busca sem resultados e para favoritos vazios.

## Dependências e SDK:
+ __Flutter__: 3.50.0
+ __SDK__: 3.13.5
+ __http__: 1.6.0

## Instruções de Execução:
### __Pré-requisitos__
+ Flutter SDK instalado.
+ Android Studio com os plugins Flutter e Dart instalados.
+ Um emulador Android ou celular conectado.
+ Conexão com a internet.

### __Passos no Android Studio:__
+ Abra o projeto em File > Open e escolha a pasta do projeto.
+ Abra o arquivo pubspec.yaml e clique em Pub get, baixando as dependências.
+ Escolha o emulador ou o celular na lista de dispositivos.
+ Clique no Run.

### __Ou pelo terminal:__
+ Abra a pasta do projeto no terminal.
+ Baixe as dependências: `flutter pub get`
+ Rode o app com o emulador ou o celular conectado: `flutter run`