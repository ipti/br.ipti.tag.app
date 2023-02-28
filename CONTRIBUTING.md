# GUIA PARA CONTRIBUIÇÃO PARA O PROJETO

Siga esse Guia para iniciar o seu processo de contribuição

## REQUISITOS PARA EXECUÇÃO

## 1) - Instale a ferramenta de gestão de Monorepos chamada Melos [siga esses passos](https://melos.invertase.dev/getting-started)

```
dart pub global activate melos
```

obs: Para que melos ou outros pacotes do Dart funcionem globalmente, é necessário adicionar PATH do sistema operacional [veja aqui como fazer isso](https://dart.dev/tools/pub/cmd/pub-global#running-a-script-from-your-path)

##  2) - Baixe as dependencias do projeto

Execute esse comando para baixar as dependencias em todos os projetos geridos pelos melos nesse repositório

```
melos bootstrap
```
##  3) - Construa os arquivos auxiliares do SDK
Para executar o build runner e geras as classes do json_serializer e sealed classes do pacote freezed
```
melos run gen:sdk 
```
Caso deseje que build_runner permança em execução obsevando alterações nos arquivos (recomendado quando está alterando o SDK)

```
melos run gen:watch:sdk 
```

##  4) - Configure o firebase
O Firebase é utilizado na aplicação apenas para captura de erros com o crashanalytics e para avaliação de performace, seu uso é opcional e pode ser desativado na configuração do app em ``` core > config >  dev_config.dart ```

Para configurar o firebase você pode utilizar flutterfire_cli, ou o método manual.
### 4.1)  - (opcional) Configuração com ``` flutterfire_cli ```
Para instalar o flutterfire_cli, antes você precisa configurar outra CLI, a do firebase. Ela executa utilizando o nodejs.

Obs: Caso esteja usando Windows, recomendo a instalação do NVM, [siga os seguintes passos](https://learn.microsoft.com/pt-br/windows/dev-environment/javascript/nodejs-on-windows)

Após o node configurado: 

- Instale o firebasecli com o seguinte comando:
``` 
npm install -g firebase-tools 
```

Caso ocorra algum problema, veja o tutorial oficial [clique aqui](https://firebase.google.com/docs/cli?hl=pt-br#windows-npm)

A principal causa de problemas nesse passo é causado por falta de permissão para execução do NPM pelo PowerShell

- Faça login no firebase usando: 
```
firebase login
```

- Instale o flutterfire_cli
```
dart pub global activate flutterfire_cli
```
- Configure o o firebase e gere o arquivos ``` firebase_options.dart ```
```
flutterfire configure
```

Após esses passos, o projeto ira executar sem maiores problemas, o comando configure executa todos os passos de configuração do projeto firebase, desde a gestão dos projetos android, ios e web como a configuração dos arquivos de acesso e chaves de autenticação.


## 5) Executando a aplicação
Todos os passos executados, é possível executar o projeto normalmente.

