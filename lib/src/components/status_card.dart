import 'package:flutter/material.dart';
import 'package:millenium/src/components/custom_divider.dart';

class StatusCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Card(
        child: Container(
          decoration: BoxDecoration(border: Border.all()),
          child: ExpansionTile(
            title: Text(
              "Status",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomDivider(
                    height: 1,
                  ),
                  _buildRow("Vida", 70),
                  CustomDivider(
                    height: 1,
                  ),
                  _buildRow("Energia", 20),
                  CustomDivider(
                    height: 1,
                  ),
                  _buildRow("Fome", 87),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String text, int valor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(children: <Widget>[
        Expanded(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        Expanded(
          child: Text(
            "$valor",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
      ]),
    );
  }
}
