import 'package:flutter/material.dart';

main() => runApp(PerguntaApp());

class PerguntaApp extends StatelessWidget {
  final perguntas = [
    "Qual é a sua cor favorta?",
    "Qual é o seu aniaml favorito",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*
        AULA 35 - Usando o Column para organizar os Widgets
        
        O Column serve para adicionar (via array) alguns outros widgets dentro de uma parte
        do código! É possível usar simplismente colocando dentro do body e verificar

          body: Column(
            children: [
              Text("Linha 1"),
              Text("Linha 2"),
              Text("Linha 3"),
            ]
          )
        Dentro do Column é necessário colocar o children (filho)

        Existe uma maneira de fazer a mesma coisa do Column de forma rápida, seleciona
        o Text() e aperta "CMD + ." e ira dar algumas opções "WRAP (envolver) with Column"
        e ele irá envolver dentro do body e inserir o Column junto com o children

        --- ENVIANDO STRING PARA DENTRO DO CODIGO
        Nos podemos criar uma lista (por exemplo) no código, e então passar ela para dentro
        do código

          children: [
            Text(perguntas.elementAt(0)), // aqui ele irá pegar o primeiro indice da lista perguntas
            Text(perguntas[1]), // aqui ele irá pegar o segundo indice
          ]

        Os componentem tem muito de terem o componente filho (child), ao invés de criar um
        botão que irá receber um valor textual ou um ícone, criamos um botão que recebe um
        filho (o outro widget), e esse outro widget pode ser uma coluna (Column), linha, 
        texto, icone + text, icone. No caso do RaisedButton, ele recebe apenas um child,
        então se quiseremos colocar mais de um, precisamos colocar dentro de algum outro
        componente que irá agrupar (via array) eles.

        É desta maneira que vamos compondo a interface, de maneira flexivel

        RaisedButton ():
          Ele cria um botão (quadrado) que pode ser clicavel, ele recebe um filho e o
          onPressed (que ira receber a ação quando for clicado).
          Nós podemos colocar diversos desse botão, uma vez que o Column recebe esse
          um array e pode ir inserindo varias vezes neles
      */
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntas"),
        ),
        body: Column(
          children: [
            Text(perguntas.elementAt(0)),
            const RaisedButton(
              child: Text("Resposta 1"),
              onPressed: null,
            ),
            const RaisedButton(
              child: Text("Resposta 2"),
              onPressed: null,
            ),
            const RaisedButton(
              child: Text("Resposta 3"),
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }
}
