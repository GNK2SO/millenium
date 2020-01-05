import 'package:flutter/material.dart';
import 'package:millenium/src/components/utils/custom_divider.dart';

class CardRow extends StatelessWidget {
  final String text;
  final String valor;

  CardRow({@required this.text, @required this.valor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        CustomDivider(height: 1),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 5,
              child: Text(
                text,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                valor,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
          ]),
        ),
      ],
    );
  }
}
