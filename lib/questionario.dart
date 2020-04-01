import 'package:flutter/material.dart';
import './resposta.dart';
import './Questao.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function(int) responder;

  Questionario({
    @required this.perguntas,
    @required this.perguntaSelecionada,
    @required this.responder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]["respostas"]
        : null;
    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]["texto"]),
        ...respostas.map((resposta) {
          return Resposta(
            resposta['texto'],
            () => responder(resposta['nota']),
          );
        }).toList()
      ],
    );
  }
}
