/*
  72. Executando em Dispositivo iOS Real

  1) Telefone/Tablet conectado via USB no computador
  2) Para fazer essa parte precisamos ter uma conta dentro de
    developer.apple.com > account > criar conta
  3) Abra o xCode (Open Another Project, na primeira tela)
  4) Va ate o projeto e abra a pasta chamada ios (não abra a posta inteira)
  5) Ao abrir o projeto, coloquei na primeira pasta (na raiz)
  6) Na aba superior, clique em "Signing & Compatibilities" e selecione
    um Developer Team, se não aparecer nada, clique em "Add an Account"
  7) Feito isto, não precisamos mais usar o xCode, podemos fechar ele
  8) Agora no vsCode, podemos selecionar o nosso telefone na barra inferior
  9) Agora é dar "start without debugging" ou "RUN" no main.dart
    * Mesmo assim, ainda dara problema, porque o iOS não irá reconhecer
    como um desenvolvedor confiavel
  10) No telefone/Tablet 
    > Settings > General > Profiles & Devices Management > Developer App
      > Trust "Apple Development: abcde@fghij.lmn.pq"
  11) Agora podemos abrir a aplicação normalmente.

  flutter cannot open iproxy


*/

import 'package:flutter/material.dart';
import '../../resultado.dart';
import '../../questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  int _pontuacaoTotal = 0;
  var _perguntaSelecionada = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': "Qual é a sua cor favorta?",
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 1}
      ]
    },
    {
      'texto': "Qual é o seu animal favorito",
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 10},
        {'texto': 'Cobra', 'pontuacao': 5},
        {'texto': 'Elefante', 'pontuacao': 3},
        {'texto': 'Leão', 'pontuacao': 1},
      ]
    },
    {
      'texto': "Qual seu instrutor favorito",
      'respostas': [
        {'texto': 'Maria', 'pontuacao': 10},
        {'texto': 'João', 'pontuacao': 5},
        {'texto': 'Leo', 'pontuacao': 3},
        {'texto': 'Pedro', 'pontuacao': 1},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
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
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
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
