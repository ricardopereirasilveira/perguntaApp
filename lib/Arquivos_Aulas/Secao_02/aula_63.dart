/*
  63. ADICIONANDO PONTUACAO

  .map((resp) => Resposta(resp['texto'].toString(), quandoResponder)).toList(),

  Agora iremos associar as nossas respostas a uma pontuação
  Então modificamos o mapa para sempre ter um TEXTO e um PONTUACAO
  para cada valor informado

  Com isto, dentro de 'questionario.dart' teremos que modificar a lista
  'respostas' para receber uma Lista de Map que contem String e Objeto
  List<Map<String, Object>> respostas





*/

import 'package:flutter/material.dart';
import '../../resultado.dart';
import '../../questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': "Qual é a sua cor favorta?",
      'respostas': [
        {'texto': 'Preto', 'notas': 10},
        {'texto': 'Vermelho', 'notas': 5},
        {'texto': 'Verde', 'notas': 3},
        {'texto': 'Branco', 'notas': 1}
      ]
    },
    {
      'texto': "Qual é o seu animal favorito",
      'respostas': [
        {'texto': 'Coelho', 'nota': 10},
        {'texto': 'Cobra', 'nota': 5},
        {'texto': 'Elefante', 'nota': 3},
        {'texto': 'Leão', 'nota': 1},
      ]
    },
    {
      'texto': "Qual seu instrutor favorito",
      'respostas': [
        {'texto': 'Maria', 'nota': 10},
        {'texto': 'João', 'nota': 5},
        {'texto': 'Leo', 'nota': 3},
        {'texto': 'Pedro', 'nota': 1},
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntas"),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder)
            : Resultado("Parabéns FDP!"),
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
