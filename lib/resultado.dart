import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final Function() reset;

  Resultado({@required this.pontuacao, @required this.reset});

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabens';
    } else if (pontuacao < 12) {
      return 'Você é bom!';
    } else if (pontuacao < 16) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
          FlatButton(
            onPressed: reset,
            child: Text("Reset"),
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
