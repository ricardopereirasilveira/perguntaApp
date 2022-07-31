/*
  52 - Lista para Widgets #01

  Um conceito importante em programação é entender a diferença
  de um código hiperativo e um código declarativo, por exemplo
  quando criamos uma página HTML, nós estamos criando um código
  declarativo, isto porque nós não estamos informando para o
  Browser como pegar aqueles "comandos" e como desenhar aquilo
  na tela, nós estamos simplesmente dizendo o que nós queremos

  Um código declarativo diz o que nós queremos e um código hiperativo
  diz exatamente como ele vai executar o código

  Quando fazemos uma consulta SQL nós fazemos:
  SELECT cpf, nome FROM cliente
  nós estamos dizendo que queremos o cpf e o nome da tabela cliente
  como o banco de dados irá implementar isto, se é consultando toda
  a tabela, se é indo de trás pra frente, se é indo em ordem alfabetica
  nós não sabemos, porque não estamos apontando como fazer, nós
  estamos apenas dizendo o que nós queremos, como resposta da nossa
  consulta, então, SQL também é uma linguagem declarativa

  no Flutter, quando trabalhamos com View, nós trabalhamos de forma
  declarativa, porque simplismente vamos colocando os componentes e
  como ele irá gerar isto é algo interno do framework, eventualmente
  nós podemos usar parte do código de forma hiperativa, mas o ideal é
  usar sempre de forma declarativa 

  No flutter nós dizemos menos como tem que ser feito e mais o que tem 
  que ser feito

  A ideia é colocar a lista de resposta direto no componente pegando através
  do MAP
  se nós firzemos um FOR, pegaremos os valores 

  for (var textoResp in perguntas[_perguntaSelecionada]['respostas]) {
    print(textoRes);
  }
  Aqui estaremos pegando através da lista as informações das respostas

  List<Widget> respostas = [];
  for (var textoRest in perguntas[_perguntaSelecionada].cast()['respostas']) {
    respostas.add(Resposta(textoRest, _responder));
  }

  aqui de forma hiperativa nos estamos falando para o código o que deve ser feito

  o operador "..." (spread) faz com os elementos da lista sem adicionados em outra lista

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

  @override
  Widget build(BuildContext context) {
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

    List<Widget> respostas = [];
    for (var textoRest in perguntas[_perguntaSelecionada].cast()['respostas']) {
      respostas.add(Resposta(textoRest, _responder));
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntas"),
        ),
        body: Column(
          children: [
            Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
            ...respostas,
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
