/*
  49 - PASSANDO FUNCAO CALLBACK

  ----> file: resposta.dart
  
  Mais uma coisa que podemos passar no RaisedButton são as cores do texto e do botão

  textColor: Colors.white,
  color: Colors.blue,

  então ao habilitar o botão (não funciona com ele desabilitado), ele tera essas cores
  * nós podemos passar uma função nula "() {}" então ele ativa o botão, embora não faça
  absolutamente nada

  Agora iremos envolver o RaisedButton dentro de um Container e então colocamos a
  largura (width) infinita, assim os botões irão se 'esticar' e ficar do tamanho da tela

  se analisarmos, o onPressed espera uma Function que retorna void "void Function", então nós
  podemos criar essa função
  por padrão, as funções que são recebidas no onPressed recebem o nome de "onSelecao"
  mas nesse caso iremos chamar de "quandoSelecionado"

  Agora podemos passar o metodo "_responder" sem invocar ele, como segundo parametro da classe
  Resposta, porém não basta isto
  Dentro do resposta.dart, no onPressed temos que enviar a função para ele 
    onPressed: quandoSelecionado,
  
  De forma com que, quando clicado ele chama o quandoSelecionado e o quandoSelecionado
  é exatamente a função enviada pelo _responder

  main.dart -> Clica na "Resposta 3" -> chama o método _responder -> Armazena na
    "resposta.dart" no quandoSelecionado -> executa a função

*/

import 'package:flutter/material.dart';
import '../../questoes.dart';
import '../../resposta.dart';

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
    "Qual é o seu animal favorito",
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
            Resposta("Resposta 1", _responder),
            Resposta("Resposta 2", _responder),
            Resposta("Resposta 3", _responder),
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
