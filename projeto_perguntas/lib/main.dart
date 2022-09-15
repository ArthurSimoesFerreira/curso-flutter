import 'package:flutter/material.dart';
import 'questionario.dart';
import 'resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      "texto": "Qual a sua cor favorita?",
      "respostas": [
        {"texto": "Preto", "pontuacao": "10"},
        {"texto": "Vermelho", "pontuacao": "5"},
        {"texto": "Verde", "pontuacao": "3"},
        {"texto": "Azul", "pontuacao": "5"},
      ],
    },
    {
      "texto": "Qual é o seu animal favorito",
      "respostas": [
        {"texto": "Cachorro", "pontuacao": "10"},
        {"texto": "Gato", "pontuacao": "5"},
        {"texto": "Lontra", "pontuacao": "3"},
        {"texto": "Capivara", "pontuacao": "1"},
      ]
    },
    {
      "texto": "Qual é o seu herói favorito",
      "respostas": [
        {"texto": "Batman", "pontuacao": "10"},
        {"texto": "Superman", "pontuacao": "5"},
        {"texto": "Capitão América", "pontuacao": "3"},
        {"texto": "She-Hulk", "pontuacao": "1"},
      ]
    },
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntas"),
          centerTitle: true,
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
              )
            : Resultado(
                pontuacao: _pontuacaoTotal,
                reiniciarQuestionario: _reiniciarQuestionario,
              ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
