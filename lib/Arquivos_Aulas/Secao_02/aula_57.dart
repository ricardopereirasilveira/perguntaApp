/*
  57 - Dividindo APP em Widgets

  Vamos entender a aplicação e verificar quando devemos criar componentes ou não

    **** VERIFICAR A AULA PARA VERIFICAR A ARVORE DE COMPONENTES

  Quando eu devo separar em componentes menores ou manter em um componente com 
  maior quantidade de elementos?
    - A resposta padrão é tentarmos quebrar a aplicação em multiplus componentes
    ou seja, quanto menor nós tivermos um componente, mais interessante e mais 
    reusavel ele será, porém não quebraremos em um nível de granularidade, como
    a cada texto colocar em um novo componente, ou cada botão colocar em um componente
    porque isso pode gerar dificuldade para fazer a manutenção da aplicação
  
  O grande norte que precisamos ter é ter componentes pequenos (nada de componentes
  gigantes), manter a aplicação de forma organizada, que seja simples de manter 
  e simples de entender o código

  Eventualmente podemos ter aplicações grandes com árvores de hierarquia grande, isto 
  não é um problema, mas é interessante que quebre sempre em componentes pequeno mas
  não a ponto de ter uma granularidade tão pequena que fica dificil até de entender 
  a aplicação, sempre tem que ter um meio termo
  
  



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
