import 'package:flutter/material.dart';

main() => runApp(PerguntaApp());

class PerguntaApp extends StatelessWidget {
  final perguntas = [
    "Qual é a sua cor favorta?",
    "Qual é o seu aniaml favorito",
  ];

  void responder() {
    print('Pergunta Respondida');
  }

  void Function() funcaoQueRetornaUmaOutraFuncao() {
    return () {
      print("pergunta respondida #2");
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*
        AULA 36 - Conectando função ao Evento do Botão
        AULA 37 - Funções Anonimas

        A ídeia é colocar o método dentro da classe, para ter tudo encapsulado dentro do
        objeto, esse é o principio da OO
        O parametro nomeado "onPressed" espera uma função que tem o retorno VOID, porém
        se a gente chamar apenas o "responder()", nós estamos apenas passando uma função
        e não passando a função para o onPressedBu

        O RaisedButton é uma classe, estamos chamando ele e enviando os parametros para
        dentro dele, através de parametros nomeados. Um dos parametros é o onpressed
        que esta recebendo (erroneamente) o responder(), basta remover os () que então
        passaremos uma função como parametro para o onpressed

        onPressed: responder, // passar a função como parametro e não invocando a função
        Basta verificar a ação "print" no Console de Depuração (output)

        void Function() funcaoQueRetornaUmaOutraFuncao() {
          return () {
            print("pergunta respondida");
          };
        }
        Essa é uma função que retorna outra função dentro, assim podemos passar para dentro
        do código também, embora ela vá retornar void, neste caso podemos invocar ela
        ao chamar no onPressed

        Nós podemos mandar uma função anonima também ao selecionar o onPressed
        RaisedButton(
          child: const Text("Resposta 3"),
          onPressed: () {
            print('pressionado o botão 3');
          },
        ),

        NOTA: Quando estamos criando uma função com {} não tem a =>, ela é apenas para arrow
        function.

        ou uma arrow function
        onPressed: () => print("aaaaaa"),

        OBS: Como o RaisedButton foi descontinuado, a partir de agora podemos usar o 
        "ElevatedButton"


      */
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntas"),
        ),
        body: Column(
          children: [
            Text(perguntas.elementAt(0)),
            RaisedButton(
              child: const Text("Resposta 1"),
              onPressed: responder,
            ),
            RaisedButton(
              child: const Text("Resposta 2"),
              onPressed: funcaoQueRetornaUmaOutraFuncao(),
            ),
            RaisedButton(
              child: const Text("Resposta 3"),
              onPressed: () {
                print('pressionado o botão 3');
              },
            ),
          ],
        ),
      ),
    );
  }
}
