import 'package:flutter/material.dart';

main() => runApp(PerguntaApp());

class PerguntaApp extends StatelessWidget {
  final perguntas = [
    "Qual é a sua cor favorta?",
    "Qual é o seu aniaml favorito",
  ];

  var perguntaSelecionada = 0;

  void responder() {
    perguntaSelecionada++;
    print(perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*
        39 - USANDO STATEFULWIDGETS #01 (Entendendo "Estado")

        Estado é dados/informações utilizados pela APP, temos estados em diversos níveis diferentes
        (componentes e aplicação, por exemplo)
        Com uma arvore de componentes, em algum momentos iremos precisar compartilhar dados
        entre os componentes.

        Estados da App:
          - Usuários Autenticados
          - Produtos Carregados

        Estados do Widget
          - Valor de entrada de campo
          - o Spinner de carregamento está sendo exibido...

        -- DIFERENÇA ENTRE STATELESS vs STATEFULL

        * Stateless (Dados Podem Mudar Externamente, mas não dentro do componente Stateless)
          Parâmetros (dados de entrada) -> Widgets -> Renderiza a UI
          Nós recebemos os parametros via contrutor da classe, o ideal é que toda VAR tenha final
          Se temos um componente pai, que recebe um dado e passa para o componente filho que 
          é um Stateless, ele tem que renderizar novamente em tempo de execução, mesmo sendo
          um Stateless.
          Dentro do componente os dados são CONSTANTES, já que o componente é sem estado (Estádo constante)
          Uma vez renderizado, o componente não deveria renderizar de novo a interface gráfica.
          (Re)-renderizado quando os parametros mudam!!!


        * Stateful (Dados podem mudar externamente)
        Parametros (Dados de Entrada ) - > Widget(Estado Interno) -> Renderiza a UI
        No stateful se o Estado Interno do widget atualizar, ele atualiza a interface gráfica.
        (Re)-renderizado quando os parametros ou estado interno mudam!!


        O stateless so pode mudar a interface gráfica se vier uma solição externo, o stateful alem de receber
        algo externo, que pode mudar, ele pode mudar com alguma informação interna do Widget também

      */
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntas"),
        ),
        body: Column(
          children: [
            Text(perguntas.elementAt(perguntaSelecionada)),
            RaisedButton(
              child: const Text("Resposta 1"),
              onPressed: responder,
            ),
            RaisedButton(
              child: const Text("Resposta 2"),
              onPressed: responder,
            ),
            RaisedButton(
              child: const Text("Resposta 3"),
              onPressed: responder,
            ),
          ],
        ),
      ),
    );
  }
}
