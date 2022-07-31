/*
  AULA 43 - CRIANDO WIDGET QUESTÃO
  
  Iremos criar um novo Widget que irá substituir o componente Text(pergunta)
  e iremos criando um componente melhor, para não ficarmos criando tudo dentro
  de uma coisa só, e por questão de organização, iremos criar um novo.


  dentro da pasta LIB iremos criar um novo arquivo .dart chamado (questao.dart)
  Neste novo arquivo, nós podemos escrever "st" e dar "CTRL + SPACE" que ele irá
  dar algumas sugestões e entre elas, podemos criar o "Flutter stateless widget"

  Ao criar o StatelessWidget colocamos o nome da classe (neste caso Questao)
  Apertando "CMD + .", nós podemos importar o Material.dart diretamente

  o código ficara assim, parando de dar o erro: 

  import 'package:flutter/material.dart';
  class Questao extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Container();
    }
  }
  
  dentro do questao.dart nós iremos enviar o código da pergunta
  (Text(perguntas.elementAt(_perguntaSelecionada))), porém como não
  temos acesso a pergunta, iremos enviar (via construtor) a pergunta
  selecionada

  --> questao.dart
  final String text; //usaremos final porque é uma StatelessWidget, então deve ser
    o último valor recebido.
  Questao(this.text) // construtor

  dentro do build, iremos retonar o proprio texto
  return Text(texto!);
  
  --> main.dart
  dentro do main, iremos importar o questoes.dart criado anteriormente e iremos
  instanciar a classe questao enviando o paramentro posicional com o array o número
  da pergunta certa
  Questao(perguntas.elementAt(_perguntaSelecionada))

  Mesmo criando um componente (widget) chamado questão, nós conseguimos interagir
  dinamicamente com o APP (mesmo o app questão sendo StatelessWidget)

  Esta é a estrategia que usa para criar aplicações grandes, criar componentes
  separados e vamos agrupando os componentes complexos ate chegar no topo da arvores
  do widget, ate que chegamos no runApp enviando o perguntaApp (exemplo)
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
