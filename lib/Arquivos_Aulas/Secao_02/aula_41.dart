/*
  AULA 42 - Tornando Membros Privados


    
  */

import 'package:flutter/material.dart';

main() => runApp(PerguntaApp());

class PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;

  void responder() {
    setState(() {
      perguntaSelecionada++;
    });

    print(perguntaSelecionada);
  }

  final perguntas = [
    "Qual é a sua cor favorta?",
    "Qual é o seu aniaml favorito",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntas"),
        ),
        body: Column(
          children: [
            Text(perguntas.elementAt(perguntaSelecionada)),
            RaisedButton(
              child: const Text("Resposta 1"),
              onPressed: responder,
            ),
            RaisedButton(
              child: const Text("Resposta 2"),
              onPressed: responder,
            ),
            RaisedButton(
              child: const Text("Resposta 3"),
              onPressed: responder,
            ),
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() {
    return PerguntaAppState();
  }
}
