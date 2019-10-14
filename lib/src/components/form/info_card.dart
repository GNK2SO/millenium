import 'package:flutter/material.dart';
import 'package:millenium/src/components/utils/custom_divider.dart';
import 'package:millenium/src/models/personagem.dart';

class InfoCard extends StatelessWidget {
  final Personagem personagem;
  InfoCard({@required this.personagem});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                  _buildRow("XP", "${personagem.xp} / 25"),
                  CustomDivider(
                    height: 1,
                  ),
                  _buildRow("Level", "${personagem.level}"),
                  CustomDivider(
                    height: 1,
                  ),
                  _buildRow("Raça", "Humano"),
                  CustomDivider(
                    height: 1,
                  ),
                  _buildRow("Classe", "-"),
                  CustomDivider(
                    height: 1,
                  ),
                  _buildRow("Título", "-"),
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
