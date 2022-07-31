/*
  77. DevTools

  "CMD + SHIFT + P" ele irá abrir uma janela e podemos colocar 
  Dart: Open DevTools ou no icone superior quando esta rodando 
  a aplicação na última opção selecionar o DevTools (bolinha azul)

  Irá abrir uma aplicação na lateral e podemos verificar
  a aplicação inteira como ela esta sendo feita, todos os widgets
  e também podemos ver quanto ela esta ocupando

  As vezes achamos que o elemento deveria esticar e não esticou,
  através do Dart DevTools nós podemos verificar qual elemento
  que não esticou e o porque de não ter esticado e alterar ele

  No Overlay Guideline nós podemos ver como cada elemento esta
  sendo desenhando dentro da tela (centro, ocupando tudo, etc)

  Uma das coisas que podemos usar é o "Highlight Repaints" e nele
  toda vez que algo for renderizado, irá mostrar na cor verde dentro
  do APP, com isto, podemos otimizar o APP para cada vez menos 
  recarregar as coisas dentro do app

  Existe uma diferença grande entre repintar o componente e recriar
  o componente 

  - Quando ele é criado, ele é instanciando do zero novamente 
  - Repintar ele pega os componentes iguais da outra tela e cria
    somente o que há de novo

  Com isto, podemos imaginar que estamos atualizando apenas uma parte do
  componente, e quando verificamos através do verde, verificamos que estamos
  atualizando outras partes também

  Timeline: Quando interagimos com a aplicação ela irá mostrar em segundos o
    tempo que levou para renderizar determinados componentes na tela, podemos
    pegar eventuais anomalias como telas que levam muito tempo para serem
    carregadas, tome cuidado quando estiver em modo debug.
  
  Memory: Onde conseguimos ver o Memory Leak da aplicação, o que estamos
    consumindo em termos de memoria através de gráfico, podemos entrar
    em uma determinada tela e o consumo de memoria aumentar significativamente
    como por exemplo carregar uma lista muito grande, e então pagina determinado
    consumo de dados para não consumir tudo de uma vez
  
  Perfomance: Serve para gravarmos o uso de CPU dentro da aplicação
    o fato de monitorar ja gera um overhead na aplicação e torna a aplicação
    ainda mais consumista
  
  Logging: Conseguimos ver os Logs do que foi gerado a partir do flutter, eventuais
    momentos em que o garbbage colletor executou para liberar mais espaços, etc


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
