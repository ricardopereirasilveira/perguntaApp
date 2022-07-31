/*
  53 - Lista para Widgets #02

  Agora iremos mudar de um código hiperativo para um código declarativo
  o MAP transforma uma lista em outra lista com a mesma quantidade de elementos
  o proposito map é fazer uma transformação, por exemplo, transofmrar uma lista
  de strings em uma lista de widgets

  List<String> respostas =
    perguntas[_perguntaSelecionada].cast()['respostas'];
  List<Widget> widgets =
    respostas.map((t) => Resposta(t, _responder)).toList();

  Neste caso não precisamos fazer um FOR, dizer o que ele tem que fazer,
  nós geramos uma lista de Widgets a partir do map (que pegou de outra lista)
  
  Como hoje em dia temos que trabalhar com programação concorrente, ela o código
  declarativo (map por exemplo) é muito mais simples de trabalhar

  o que queremos: respostas.map((t) => Resposta(t, _responder)).toList();
  nós pegamos a variavel respostas (que é uma lista de strings), usamos o map
  para converter a lista de strings em listas de widgets, já que estamos dentro de
  uma árvore de componente, que com certeza o que será passado para o column serão
  widgets e uma vez convertendo para widgets transformamos o resultado em uma lista

  fizemos um spread(...) para jogar cada elemento da lista dentro do Column

  pegamos cada elemento do map 'respostas' e convertemos isso para um widget do tipo
  Resposta e colocamos isto dentro da arvore de componente



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

    List<String> respostas =
        perguntas[_perguntaSelecionada].cast()['respostas'];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntas"),
        ),
        body: Column(
          children: [
            Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
            ...respostas.map((t) => Resposta(t, _responder)).toList(),
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
