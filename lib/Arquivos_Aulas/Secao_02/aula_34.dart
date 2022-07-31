/*
 Construindo o Primeiro Widget #02
 Este é o HELLO WORLD do Flutter
*/

import 'package:flutter/material.dart';

main() => runApp(PerguntaApp());
/*
  Aqui usamos uma arrow function para chamar o PerguntaApp();
*/

class PerguntaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /* 
        * Alguns componentes recebem mais de um Widget
        Alguns componentes receber uma lista de widgets, outros recebem apenas
          um widget
        É o caso do body, se der um CTRL + SPACE no body, ira verificar que ele recebe
        apenas um Widget, isso singnifica que não podemos colocar uma "," e inserir
        o segundo widget
          body: Text(), ->Text()<- // o segundo parametro não pode ser enviado
        para contornar isso, é usando outro Widget que recebem um array de Widgets
        ao invés de receber apenas um! Iremos aprender sobre Column porque nem so
        de texto se vive uma aplicação!!!!

      */
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntas"),
        ),
        body: const Text("aaaaa"),
      ),
    );
  }
}
