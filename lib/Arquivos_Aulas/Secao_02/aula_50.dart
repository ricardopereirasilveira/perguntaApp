/*
  50 - Correção dos erros de tipo Object e String

  Fala, pessoal!

  Nessa aula vamos fazer uma pequena correção relacionada às próximas duas aulas. 
  Devido a atualizações tanto no Dart quanto no Flutter, algumas questões em 
  relação a tipagem mudaram um pouco.

  Na próximas aulas, o código exato delas irá gerar um pequeno erro de 
  tipagem na hora de transformar um Objeto em Lista e os elementos em String.

  Para corrigir é bem simples. Basta adicionar duas funções em dois pontos do 
  código, a função "cast()" para transformar um Objeto em Lista e a 
  função "toString()" para transformar os elementos em Texto.

  O primeiro caso vai acontecer lá na criação do Widget Questao:

  Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
  O segundo caso, na aula seguinte, acontece lá no for:

  for (String textoResp in perguntas[_perguntaSelecionada].cast()['respostas']) {
    respostas.add(Resposta(textoResp, _responder));
  }
  Basta adicionar as duas funções, cast() e toString() e tudo funcionará certinho!

  Bons estudos!

*/

import 'package:flutter/material.dart';
import '../../questoes.dart';
import '../../resposta.dart';

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
            Resposta("Resposta 1", _responder),
            Resposta("Resposta 2", _responder),
            Resposta("Resposta 3", _responder),
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
