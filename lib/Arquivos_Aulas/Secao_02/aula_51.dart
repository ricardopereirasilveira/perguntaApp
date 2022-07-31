/*
  51 - Usando tipo MAP nas perguntas

  Aqui nós criamos uma lista de Map que contem como primeiro parametro
  uma String e o segundo um objeto (neste caso uma lista de string)

  perguntas[_perguntaSelecionada]['texto'].toString()
  = dentro da variavel (que recebe uma lista de Map com String e Object), nós
  estamos selecionando a _perguntaSelecionada (que é uma variavel que está sendo
  incrementada manualmente), selecionando o MAP de chave ['texto] e transformando
  ele em uma string (toString())

  Enquanto em uma list nos acessamos o valor através do indice, no MAP
  nos acessamos o elemento a partir do valor. No nosso caso nos acessamos
  pelo indice que retornava um MAP então acessamos com o valor

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

  final List<Map<String, Object>> perguntas = [
    {
      'texto': "Qual é a sua cor favorta?",
      'respostas': [
        'Preto',
        'Vermelho',
        'Verde',
        'Branco',
      ]
    },
    {
      'texto': "Qual é o seu animal favorito",
      'respostas': [
        'Coelho',
        'Cobra',
        'Elefante',
        'Leão',
      ]
    },
    {
      'texto': "Qual seu instrutor favorito",
      'respostas': [
        'Maria',
        'João',
        'Leo',
        'Pedro',
      ],
    },
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
            Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
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
