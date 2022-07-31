/*
    AULA 40 - Usando StatefulWidget #02

    * É recomendado que se use sempre os componentes sem estado (Stateless Widget)
    e passar as informações via CONSTRUTOR (posicionais ou nomeados), pois assim
    o componente mais alto (componente pai) irá sempre enviar as informações para o
    filho renderizar ele novamente. TENHA O MAXIMO DE COMPONENTES STATELESS

    Transformando um StatelessWidget para Stateful
    1. A primeira coisa é mudar o extends de "Stateless" para "Stateful"
    2. Criar uma classe com o nome da classe + State (exemplo: PerguntaAppState) e
    externder de State iremos passar a anotação da propria classe Stateful
      class PerguntaAppState extends State<PerguntaApp> {}
    Com isto, nos temos uma classe que vai gerenciar o estado e uma outra classe
    que é o nosso componente Stateful. O nosso estado será gerenciado pelo 
    PerguntaAppState, então podemos enviar o "var perguntaSelecionada = 0;" para a
    classe State
    3. Passar o método build para dentro da perguntaAppState, porque a árvore de 
    componentes necessita do estado da aplicação para ser renderizada, por isto
    o build vai para o PerguntaAppState
      -- Nós movemos pra classe State, a variavel que esta sendo alterada, o método
      que sera responsavel por evluir as perguntas (incrementar o valor da variavel)
       e movemos o build (que recebe o context), até porque a árvore de componente
       precisa do estado
      O nosso estado será gerenciado por esta outra classe
    
    4. Precisa implementar um método no PerguntaApp que extende o StatefulWidget
      O método irá criar um estado dentro de StatefulWidget, o método é o createState()

      State<PerguntaApp> createState() { // podemos colocar também PerguntaAppState createState() 
        return new PerguntaAppState();
      }

    -------------------
    A primeira coisa é extender a classe de StatefulWidget
    Agora criamos a classe NomeDaClasseState  que extende de State<ClasseDoApp>
    Colocamos as variaveis dentro do estado, porque o estado agora que irá controlar
      essa variavel
    Como o método responder também precisa do estado, ele foi alterado pra dentro da Estado
    Como a árvore de componente, quando houver mudança, precisa ser atualizado de forma reativa
      (acontece uma mudança, tem que dipirar pra interface do usuario) ele foi alterado 
      também para dentro do Estado
    Conectar o Stateful com o estado
      1. A partir da herança do State, o tipo de componente(Generic) da classe do app State<PerguntaApp>
      2. Dentro da class PerguntaApp criamos um método chamado createState que retorna a class
         PerguntaAppState();
    
    O PerguntaApp é o componente que estara presente na árvore de componente, tanto que esse é o componente
    que é passado para o runApp no método main()
    O flutter detecta que o componente PerguntaApp é um StatefulWidget, ele irá chamar o createState() e então
    dentro do PerguntaAppState é que esta sendo gerenciado e a arvore de componente!

    A última coisa que faltam modificar, para a parte gráfica ser notificada quando houver mudanças é
    colocar o trecho que altera a variavel (perguntaSelecionada++) dentro de um setState

    void responder() {
      setState(() {
        perguntaSelecionada++
      });
      print(perguntaSelecionada);
    }

    pois o flutter irá ficar monitorando se houve uma mudanca e essa mudança ele irá la mudar a interface
    grafica

    Agora, quando nós clicarmos na pergunta, ele irá mudar a pergunta para o número do indice, se ele não
    encontrar o indica, ele irá dar erro na aplicação, porque não temos mais de 2 indices
    O que faz isso, é o setState para ficar monitorando a variavel que é modificada e incrementada,
    pois qualquer mudança que seja feita em cima de perguntaSelecionada, de forma reativa (ou seja,
    mudou, atualizou a interface grafica), ele renderiza novamente e mostra tudo que foi atualizado

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
