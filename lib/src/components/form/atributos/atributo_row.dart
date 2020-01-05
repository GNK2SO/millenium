import 'package:flutter/material.dart';

class AtributoRow extends StatelessWidget {
  final String text;
  final String descricao;
  final int pontos;
  final Function adicionarPonto;
  final Function removerPonto;
  final bool isAdmin;

  AtributoRow({
    this.text,
    this.descricao,
    this.pontos,
    this.adicionarPonto,
    this.removerPonto,
    this.isAdmin,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(children: <Widget>[
            Expanded(
              flex: 3,
              child: InkWell(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onTap: descricao == null
                    ? null
                    : () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(text),
                              content: Text(descricao),
                            );
                          },
                        );
                      },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.remove),
                onPressed: isAdmin ? null : removerPonto,
              ),
            ),
            Expanded(
              child: Text(
                "$pontos",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.add),
                onPressed: isAdmin ? null : adicionarPonto,
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
