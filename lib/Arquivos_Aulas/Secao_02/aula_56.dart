/*
  56 - EXIBINDO RESULTADO

  
  Nós adicionando um Center() ao final da validação
  (onde estava null/lista vazia), para quando chegar na ultima
  não enviar uma lista vazia, enviar somente um parabéns (por enquanto)



*/

import 'package:flutter/material.dart';
import '../../questoes.dart';
import '../../resposta.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final List<Map<String, Object>> _perguntas = const [
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

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada].cast()['respostas']
        : [];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntas"),
        ),
        body: temPerguntaSelecionada
            ? Column(
                children: [
                  Questao(_perguntas[_perguntaSelecionada]['texto'].toString()),
                  ...respostas.map((t) => Resposta(t, _responder)).toList(),
                ],
              )
            : const Center(
                child: Text(
                  "Parabéns",
                  style: TextStyle(fontSize: 28),
                ),
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
