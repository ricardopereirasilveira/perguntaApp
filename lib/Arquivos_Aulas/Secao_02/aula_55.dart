/*
  55 - EVITANDO ACESSAR PERGUNTA INVALIDA

  Agora iremos ajustar o problema de que, ao acessar um indice que não existe mais
  o programa quebra, por falta de indice na lista

  Embora seja um elemento stateless não é um problema ter variaveis final

  List<String> respostas = temPerguntaSelecionada
    ? _perguntas[_perguntaSelecionada].cast()['respostas']
    : [];

  Fazemos uma verificação para, verificar se o tamanho da lista é maior que a variavel que
  incrementa, então caso for, retornamos uma lista vazia

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  Este método apenas veriifica se a VAR é maior que o tamanho da lista e retorna um bool
  
  quando a variavel for maior que o tamanho da lista, ele não irá mostrar nada no APP
  porque estamos protegendo ele




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
            : null,
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
