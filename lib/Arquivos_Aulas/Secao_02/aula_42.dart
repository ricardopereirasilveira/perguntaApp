/*
  AULA 42 - TORNANDO MEMBROS PRIVADOS

  Quando começamos algo com underline, tornamos aquilo privado.
  exemplo: _variavelCriada = 0 // o _ no começo torna ela privada

  Algo que você colocar privado, é privado apenas para fora do arquivo 
  em questão, dentro do arquivo ele não é privado e teremos acesso a ele.

  O Dart não tem uma palavra reservada para atributos/variaveis privadas
  como a palavra PRIVATE por exemplo, ele faz isso através do underline

  Dentro de outros arquivos DART nós não conseguiremos acessar a variavel
  _cpf (por exemplo), somente por metodos GET and SET

  get cpf {return this.cpf} // o GET para acessar o CPF

  --- VOLTANDO AO ARQUIVO DO FLUTTER
  Iremos transformar algumas coisas em privadas, vista somente para o arquivo
  em questão

  Tornaremos o PerguntaAppState em privado (_PerguntaAppState), e modificaremos
  também dentro da classe PerguntaApp o retorno do método para a classe correta
  Mudaremos o método responder também para ser privado (visivel apenas dentro 
  do arquivo em questão)
  * "CMD + D" = ao selecionar uma palavra, ao apertar a tecla ele seleciona a palavra
  em sequencia (para selecionar varias coisas da mesma selecionada ao mesmo tempo)
  Iremos modificar também a variavel perguntaSelecionada para privada (_perguntaSelecionada)

  Agora temos a classe PerguntaAppState, a varivel perguntaSelecionada e o método responder
  privados

  O componente do APP (PerguntaApp) é público, pois se chamarmos ele em outro arquivo, queremos
  ter acesso ao componente

  RESUMINDO: Membros Privados são visiveis ainda dentro do arquivo, porém para fora do arquivo
  eles são invisiveis.

  */

import 'package:flutter/material.dart';

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
            Text(perguntas.elementAt(_perguntaSelecionada)),
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
