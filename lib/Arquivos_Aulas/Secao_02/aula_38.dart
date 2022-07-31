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
        AULA 38 - Variavéis em StatelessWidget

        O objetivo do app é quando ir para a resposta 1, 2 ou 3 ele ir pra proxima pergunta
        Criamos a variavel perguntaselecionada que recebe um INT, então podemos ir
        trocando entre as perguntas da list

        Quando colocamos uma variavel dentro de uma classe, nós começamos a trabalhar com estado,
        e estamos dento de um componente sem estado, quando passamos o mouse em cima de PerguntasApp
        ela diz que é uma classe imútavel, então deveria ter atributos finais, por exemplo

        Nós temos no flutter a ideia de uma interface reativa, isto significa que ao modificarmos
        o valor de uma variavel, ele faz de forma reativa isto em tempo de voo e mostra isto na tela
        sempre que mudarmos a aplicação a interface grafica vai acompanhar a evolução do estado
        porém, não esta mudando o estado porque nos estamos dentro de um componente sem estado (StatelessWidget)

        Isto significa que ao estarmos mudando algo (perguntaSelecionada++) nós estamos violando o
        comportante de uma classe StatelessWidget, já que todos os seus valores são finais.
        Para a aplicação parar de dar problema, era so comentar o código "perguntaSelecionada++" e
        colocar a variavel perguntaSelecionada como final
        Ao colocar final ele não irá gerar nenhum tipo de incopatibilidade com o StatelessWidget

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
