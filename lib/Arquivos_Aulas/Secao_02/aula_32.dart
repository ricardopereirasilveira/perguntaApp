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
        O Scaffold significa algo como Estrutura (da a estrutra da aplicação)
        Não foi usado o new no Scaffold, embora esteja instanciando ele
        - appBar é um parametro nomeado dentro de Scaffold
        então foi chamada a instancia AppBar que dentro tem um componente chamado TITLE

        Assim é criado a composição:
          Material App -> Scaffold(widget) -> AppBar(widget) -> Title

        Title: O title exige espera receber um Widget
          Temos que ter cuidado para não tentar enviar uma STRING ao invés de um Widget
          O widget para texto é exatamente o Text(), ele recebe um parametro posicional

        body:
          Outro componente dentro do Scaffold é o body, que podemos colocar logo abaixo
          do title, para inserir algo no body.
          Neste momento nos inserimos apenas o Text com um texto aleatório
      */
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntas"),
        ),
        body: const Text("Hello Flutter"),
      ),
    );
  }
}
