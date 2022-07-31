/*
  61. WIDGET QUESTIONARIO

  Agora iremos refatorar a parte do questionário, então criamos um novo arquivo
  e criamos uma nova classe que extende de Stateless.

  Teremos diversos erros em um primeiro momento, entao como ele é final
  criamos as variaveis e o método como variaveis

  Nós iremos passar os parametros (perguntas, perguntaSelecionadas e responder) e inserir
  um decorator "required" para dizer quesão parametros OBRIGATORIOS
  e eles so irão funcionar se passar eles

  Iremos enviar os métodos e variaveis para a nova classe para refatoração

  1. Para refatorar, a primeira coisa que fizemos foi criar o que esta 
  dando erro (neste caso perguntas, perguntaSelcionada e responder)
  Criamos exatamente com o que é necessario

  2. Passamos um construir default recebendo os 3 parametros e forçando
  com que eles fossem obrigatoriamente enviados (required). Quando
  colocamos o required por padrão ele irá exigir que seja
  enviado o parametro

  3. Envie as informações pela Classe e armazene na nova classe (Questionario)
  Como a nova classe é stateless, ela não precisa ter atributos privados
  apenas final

  



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
