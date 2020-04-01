import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(QuestionsApp());

class _QuestionsAppState extends State<QuestionsApp> {
  var _selectedQuestion = 0;
  var _pontuacao = 0;

  void _answer(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _selectedQuestion++;
        _pontuacao += pontuacao;
      });
      print(_pontuacao);
    }
  }

  void _reset() {
    setState(() {
      _selectedQuestion = 0;
      _pontuacao = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _selectedQuestion < _questions.length;
  }

  final _questions = [
    {
      "texto": "Qual é a sua cor favorita?",
      "respostas": [
        {
          'texto': "Preto",
          'nota': 10,
        },
        {
          'texto': "Vermelho",
          'nota': 5,
        },
        {
          'texto': "Verde",
          'nota': 3,
        },
        {
          'texto': "Branco",
          'nota': 1,
        },
      ],
    },
    {
      "texto": "Qual é o seu animal favorito?",
      "respostas": [
        {
          'texto': "Coelho",
          'nota': 10,
        },
        {
          'texto': "Cobra",
          'nota': 5,
        },
        {
          'texto': "Elefante",
          'nota': 3,
        },
        {
          'texto': "Leão",
          'nota': 1,
        },
      ],
    },
    {
      "texto": "Qual é o seu instrutor favorito?",
      "respostas": [
        {
          'texto': "Leo",
          'nota': 10,
        },
        {
          'texto': "Maria",
          'nota': 5,
        },
        {
          'texto': "João",
          'nota': 3,
        },
        {
          'texto': "Pedro",
          'nota': 1,
        },
      ],
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Perguntas"),
          ),
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntas: _questions,
                  perguntaSelecionada: _selectedQuestion,
                  responder: _answer,
                )
              : Resultado(
                  pontuacao: _pontuacao,
                  reset: _reset,
                )),
    );
  }
}

class QuestionsApp extends StatefulWidget {
  @override
  _QuestionsAppState createState() {
    return _QuestionsAppState();
  }
}
