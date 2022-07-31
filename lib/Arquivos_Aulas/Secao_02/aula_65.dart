/*
  65 Adicionando Pontuação #02

  return Resposta(
    resp['texto'].toString(),
    () => quandoResponder(int.parse(resp['pontuacao'].toString())),
  );

  O que será feito:
  No momento em que o usuário seleciona, dentro de questionario.dart
  na variavel "responder", nós sabemos exatamente quanto vale porque
  sabemos a resposta do usuário, então no momento que o usuario clicar
  na resposta, nós precisamos passar a resposta de volta para o método
  main

  então, no main, nós iremos receber como parametro na função responder
  um int com a informação da resposta

  então teremos que mudar, dentro do questionario.dart a função
    final void Function(int potuacao) responder;
  e ela ira enviar para o main.dart as informações da pontuação

  então no main.dart iremos que retornar uma função ao invés de retornar o map
  direto, através do
   () => responder(int.parse(resp['pontuacao'].toString()))

  com isto, estamos fazendo o parse da informação inteira e convertendo para
  String

  O que fizemos para receber os pontos no main:

  Os definimos uma função (_responder) que recebe um inteiro como parametro
  La no questionario.dart nós mudamos o método (responder) para receber
  como parametro um inteiro também, que é exatamente o tipo de função do
  _responder no main.dart, em ambos os casos, ela não retornam nada
  
  no momento em que recebemos um parametro no responder dentro de questionário.dart
  nós não podemos simplismente passar para um método que de fato ira detectar
  o click que é o componente resposta.dart

  o componente resposta é o que chama de fato essa função no momento do onPressed
  ou seja, quando clica no botão, ele ira chamar o "quandoSelecionado"
  porém o onPressed, se orlharmos ela não recebe nenhum parametro, ela simplismente
  recebe uma função que retorna void e não recebe nenhum parametro

  Não mexeremos ali, mas la no questionário nós precisamos de alguma forma
  passar a pontuação como parametro pro método (quandoResponder()), então ao
  invés de chamar, passando a referencia da função (sem os parenteses), eu precisei
  de forma explicita, passar o parametro pra essa função e como estavamos
  precisando chamar a função passando o parametro colocamos a chamada da função
  dentro de uma outra função, já que precisamos passar como referencia pro
  metodo uma função, então nesse caso fizemos uma arrow function (não sendo
  obrigado ser uma arrow, poderia ser uma função anonima apenas), então estamos
  passando uma função so que dentro dessa função passamos realmente a função que
  iremos chamar passando o paramentro de pontuação

  Então basicamente passamos a função passando a chamada da função dentro da arrow
  function
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

    print(_pontuacaoTotal);
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
