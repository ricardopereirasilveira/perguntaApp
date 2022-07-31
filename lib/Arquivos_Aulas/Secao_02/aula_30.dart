/*
 Construindo o Primeiro Widget #02
 Este é o HELLO WORLD do Flutter
*/

import 'package:flutter/material.dart';

main() {
  // o método main é a porta de entrada da aplicação flutter
  runApp(PerguntaApp());
}

class PerguntaApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return const MaterialApp(
      /*
      aqui estamos instancia o MaterialApp (podemos colocar new ou não)
      se usar o CTRL + SPACE aqui dentro, podemos ver todos os parametros
      noemados que podemos usar aqui dentro
      */

      home: Text("Olá Flutterrrrrasdadas"),
    );
  }
}
