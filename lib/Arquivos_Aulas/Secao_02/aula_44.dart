/*
  AULA 44 - CONTAINER WIDGET

  Modelo de Caixa (parecido com o da WEB), tem o padding, border, etc.
  Igual ao da WEB.

  Nós temos um atributo dentro do container que é o child (= Conteudo)
  O child representa o conteúdo, ou seja, o que você quer colocar dentro do
  container
  Logo na sequencia tem o Padding que é um espaçamento dentro do proprio container
  então o conteudo não fica grudado com as bordas do container, se colocarmos cor
  no container, iremos verificar que o container irá tomar mais espaço e o conteúdo
  está pegando apenas uma parte central 
  Temos a bordar, para definir uma borda para o container
  Temos também o Margin, que separa o container com os outros elementos, a Margin já
  está fora do que seria o Container, pois o container vai ate a borda 
  __________________
  |     MARGIN      |
  |_________________|
  |     BORDER      |
  |_________________|
  |     PADDING     |
  |_________________|
  |                 |
  | CHILD(=CONTEUDO)|
  |_________________|
  |     PADDING     |
  |_________________|
  |     BORDER      |
  |_________________|
  |     MARGIN      |
  |_________________|

  Alguns determinados widgets não tem padding, então para colocar padding em um widget que não tem componente
  chamado Padding, então é so envolver aquele widget com o componente Padding, que conseguimos dar um padding nele
  
*/

import 'package:flutter/material.dart';
import '../../questoes.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
    print(_perguntaSelecionada);
  }

  final perguntas = [
    "Qual é a sua cor favorta?",
    "Qual é o seu aniaml favorito",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntas"),
        ),
        body: Column(
          children: [
            Questao(perguntas.elementAt(_perguntaSelecionada)),
            RaisedButton(
              child: const Text("Resposta 1"),
              onPressed: _responder,
            ),
            RaisedButton(
              child: const Text("Resposta 2"),
              onPressed: _responder,
            ),
            RaisedButton(
              child: const Text("Resposta 3"),
              onPressed: _responder,
            ),
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() {
    return _PerguntaAppState();
  }
}
