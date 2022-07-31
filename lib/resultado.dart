import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciarQuestionario;

  Resultado(this.pontuacao, this.reiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 8) {
      return "parabéns";
    } else if (pontuacao < 12) {
      return "você é bom!!!";
    } else if (pontuacao < 16) {
      return "impressionante!!!!";
    } else {
      return "nível Jedi";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        FlatButton(
          child: const Text(
            'Reinciar?',
            style: TextStyle(fontSize: 18),
          ),
          textColor: Colors.blue,
          onPressed: reiniciarQuestionario,
        ),
      ],
    );
  }
}
