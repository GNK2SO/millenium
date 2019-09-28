import 'package:flutter/material.dart';
import 'package:millenium/src/components/custom_divider.dart';

class InfoCard extends StatelessWidget {
  bool update;

  InfoCard();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Card(
        child: Container(
          decoration: BoxDecoration(border: Border.all()),
          child: ExpansionTile(
            title: Text(
              "Info",
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
                  _buildRow("XP", "0 / 25"),
                  CustomDivider(
                    height: 1,
                  ),
                  _buildRow("Level", "1"),
                  CustomDivider(
                    height: 1,
                  ),
                  _buildRow("Raça", "Humano"),
                  CustomDivider(
                    height: 1,
                  ),
                  _buildRow("Classe", "Guerreiro"),
                  CustomDivider(
                    height: 1,
                  ),
                  _buildRow("Título", "O Suicída"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String text, String descricao) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(children: <Widget>[
        Expanded(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Expanded(
          child: Text(
            descricao,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ]),
    );
  }
}
