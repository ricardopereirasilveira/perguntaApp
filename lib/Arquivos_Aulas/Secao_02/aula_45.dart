/*
  AULA 45 - APLICANDO ESTILO AO WIDGET QUESTAO;
  
  ------> file: questao.dart
  Se nós não damos uma virgula e salva o código, ele salva o código assim
  return Text(texto);
  Agora se colocamos a virgula, ele formata assim

  return Text(
    texto, // a virgula aqui <------
  );
  Quando queremos ter mais atributos, colocamos uma virgula no final
  OPTION + SHIFT + S // formatar o código
  
  Usarmeos uma propriedade nomeada chamada 'style' que irá receber um TextStyle()
  dentro, podemos colocar o fontsize: 28, ficando assim

  Text(
    texto,
    style: TextStyle(fontSize: 28), // tamanho da fonte
    textAlign: TextAlign.center, // centralização do text
  );

  textAlign: textAlign.center // irá colocar o texto no meio.
  Porém, se olharmos a aplicação, ele não irá modificar, porque o box atrás
  tem o mesmo tamanho, então o texto no meio, esta cobrindo 100% do tamanho
  da box

  Pra podermos centralizar, temos que envolver o texto em um container
  (por exemplo), para isto, basta selecionar o Text() e clicar com 
  "CMD + ." e depois em "WRAP WITH CONTAINER"

  O container, ao criado, também tera o mesmo tamanho do texto, mas podemos
  colocar um atributo, que no caso é a largura (width:), e nela temos algumas
  estrategias, mas podemos colocar a largura de 100%, passando o
  double.infinity, ficando assim

  return Container (
    width: double.infinity, // 100% da tela na horizontal
    child: Text(
      texto, // string do TEXTO passada no contrutor
      style: TextStyle(fontSize: 28) // tamanho da fonte
      textAlign: TextAlign.center, // texto mostrado no meio
    )
  )

  Agora conseguimos ver o texto centralizado, uma vez que se comentar o textAlign
  o texto irá todo para esquerda.

  A proxima coisa que podemos passar é o margin, que recebe um EdgeInsetsGeometry
  porém como ela é uma classe abstrata vamos usar o EdgeInsets.

  OBS: Tem o EdgeInsets.fromLTRB (Left, Top, Right e Bottom (ou, Esquerda, Superior, Direita e inferior))
  Neste primeiro momento iremos passar o EdgeInsets.all(10), que ele irá colocar uma margem nos 4 cantos
  de 10px
  Nada no aplicatico em termo funcional foi alterado, apenas a parte visual

  A ídeia é ir sempre separando tudo, porque se tiver tudo dentro do main.dart, a arvore
  estaria gigante, como colocamos algumas coisas dentro do questoes.dart ela
  ficou bem menor porque dividimos os componentes

*/

import 'package:flutter/material.dart';
import '../../questoes.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
    print(_perguntaSelecionada);
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
            Questao(perguntas.elementAt(_perguntaSelecionada)),
            RaisedButton(
              child: const Text("Resposta 1"),
              onPressed: _responder,
            ),
            RaisedButton(
              child: const Text("Resposta 2"),
              onPressed: _responder,
            ),
            RaisedButton(
              child: const Text("Resposta 3"),
              onPressed: _responder,
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
    return _PerguntaAppState();
  }
}
