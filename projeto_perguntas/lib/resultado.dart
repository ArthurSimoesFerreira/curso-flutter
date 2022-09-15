import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciarQuestionario;

  const Resultado(
      {required this.pontuacao,
      required this.reiniciarQuestionario,
      super.key});

  String get fraseResultado {
    if (pontuacao < 8) {
      return "Parabéns!";
    } else if (pontuacao < 12) {
      return "Voce é bom";
    } else if (pontuacao < 16) {
      return "Impressionante";
    } else {
      return "Tu é brabo demais, vasco da gama";
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
            style: const TextStyle(
              fontStyle: FontStyle.italic,
              backgroundColor: Colors.black,
              color: Colors.white,
              fontSize: 36,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        TextButton(
          onPressed: reiniciarQuestionario,
          child: const Text("Reiniciar",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 24,
              )),
        )
      ],
    );
  }
}
