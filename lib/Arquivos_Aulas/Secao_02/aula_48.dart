/*
  48 - DESAFIO NOVO WIDGET - RESPOSTA
  O Desafio consistia em criar um novo Widget para receber o valor de resposta
  Era necessario criar a classe Stateless e no construtor receber ela!

  A ideia é criar um novo componente que transforma o texto "Resposta X" em um
  widget, não mandar os valores da classe Main para a classe Resposta

  1. Cria um arquivo chamado resposta.dart 
  2. Criar um stateless e a classe irá receber no construtor default uma String
  3. Então jogaremos o RaisedButton para dentro dessa classe e passaremos
    através do construtor a string, que retornara todo o botão e construira
    dentro da classe Resposta todo o seu botão
  4. Jogaremos a classe Resposta('Texto') dentro da main dart, deixando o código
    mais enxuto ainda
  

*/

import 'package:flutter/material.dart';
import '../../questoes.dart';
import '../../resposta.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder(var texto) {
    Resposta(texto);
    setState(() {
      _perguntaSelecionada++;
    });
    print(_perguntaSelecionada);
  }

  final perguntas = [
    "Qual é a sua cor favorta?",
    "Qual é o seu animal favorito",
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
            Resposta("Resposta 1"),
            Resposta("Resposta 2"),
            Resposta("Resposta 3"),
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
