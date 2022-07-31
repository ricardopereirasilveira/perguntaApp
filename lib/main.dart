/*
  67 - REINICIANDO QUESTIONÁRIO

  Uma das coisas importantes entre as comunicações entre os componentes
  é que temos a comunicação direta (que é quando um componente pai passa
  parametros para o componente filho ) e a comunicação indireta (quando o
  componente pai passa uma função para o componente filho para que o 
  componente filho chame essa função e desta forma o pai é notificado).

  Exemplo comunicação Direta:
    O componente APP (componente perguntaApp, passou um parameto (_pontuacaoTotal)
    para o componente filho (Resultado) de tal forma que o componente filho mostra
    o determinado valor).
    Questionario também uma comunicação direta no perguntas e perguntaSelecionada
    já no responder ele recebe um método como parametro que devolve uma função

   O responder recebe do componente filho o atributo pontuacao (vem do componene filho)
   E a comunicação direta diz que vamos mandar uma função pro componente filho
   O componente filho irá chamar essa função e pode mandar dados para o compnente
   pai a partir dos parametros da função responder
  
  Vamos criar, baseado nessa função responder outra função que faz o mesmo
  mecanismo, ela vai chamar (_reiniciarQuestionario) que irá reinciar
  as variaveis _perguntaSelecionada e _pontuacaoTotal dentro do SetState
  já que extende de uma Stateful e uma vez que a variavel pergunta é final
  e as _perguntaSelecionada e _pontuacaoTotal não tem final no atributo
  podem ser alteradas sem problemas

  Agora precisamos passar a função _reiniciarQuestionario como parametro 
  para o componente Resultado (resultado.dart)

  Lá iremos criar uma nova variavel que irá receber uma função


  no Resultado (quando aparece o resultado do nível), vamos envolver dentro
  de um Colum (o texto ira ficar no nível de cima da tela (abaixo do appBar))
  para voltar o resultado para o centro (veritical) basta usar a propriedade
  (mainAxisAlignment: MainAxisAlignment.center ) e o ".center" irá deixar 
  no centro do eixo Y

    DICA Aula Youtube: Essa técnica é fundalmental para fluter, reac native e WEB!
    (aula da Cod3r Cursos) onde mostra os diversos cenários possíveis para configurar
    um flex container, flex item, mainAxels, crossAxels
  
  Agora que temos mais de um elemento (filho), depois de Center podemos colocar um
  botão (FlatButton) que no child recebe um texto e podemos customizar
  a cor do botão. Nela iremos mandar a função (sem invocar ela) chamada
  reiniciarQuestionario (que irá zerar as variaveis pai) no 'onPressed' e
  volta para o inicio.

  Neste caso (reiniciarQuestionário) tivemos uma comunicação indireta, ou seja,
  passamos uma comunicação direta para o filho (pai > filho) e no filho
  a função foi invocada de tal forma que consegue se comunicar com o pai
  porém nesse caso não passamos parametro nenhum, mas poderia

  main.dart
    void reiniciarQuestionario(*Sting test*) {
      setState (() {
        _perguntaSelecionada = 0;
        _pontuacaoTotal = 0;
      });
      print(test);
    }

  resultado.dart
  final void Function(*String*) reiniciarQuestionario;

  (e ao chamar)
  onPressed: () => reiniciarQuestionario('Legal!!!!!!!') // aqui vai a string que irá para o pai
  de forma de arrow function


*/

import 'package:flutter/material.dart';
import 'resultado.dart';
import './questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  int _pontuacaoTotal = 0;
  var _perguntaSelecionada = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': "Qual é a sua cor favorta?",
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 1}
      ]
    },
    {
      'texto': "Qual é o seu animal favorito",
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 10},
        {'texto': 'Cobra', 'pontuacao': 5},
        {'texto': 'Elefante', 'pontuacao': 3},
        {'texto': 'Leão', 'pontuacao': 1},
      ]
    },
    {
      'texto': "Qual seu instrutor favorito",
      'respostas': [
        {'texto': 'Maria', 'pontuacao': 10},
        {'texto': 'João', 'pontuacao': 5},
        {'texto': 'Leo', 'pontuacao': 3},
        {'texto': 'Pedro', 'pontuacao': 1},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
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
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
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
