import 'package:flutter/material.dart';
import 'package:millenium/src/components/utils/custom_divider.dart';
import 'package:millenium/src/models/personagem/personagem.dart';

class StatusCard extends StatelessWidget {
  final Personagem personagem;
  StatusCard({@required this.personagem});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                  _buildRow(
                    "Vida",
                    "${personagem.vidaAtual}/${personagem.vidaTotal()}",
                  ),
                  CustomDivider(
                    height: 1,
                  ),
                  _buildRow(
                    "Energia",
                    "${personagem.energiaAtual}/${personagem.energiaTotal()}",
                  ),
                  CustomDivider(
                    height: 1,
                  ),
                  _buildRow(
                    "Mana",
                    "${personagem.manaAtual}/${personagem.mana}",
                  ),
                  CustomDivider(
                    height: 1,
                  ),
                  _buildRow("Fome", "${personagem.fome}"),
                  CustomDivider(
                    height: 1,
                  ),
                  _buildRow(
                    "Dano",
                    "${personagem.dano()}",
                  ),
                  CustomDivider(
                    height: 1,
                  ),
                  _buildRow(
                    "Defesa",
                    "${personagem.defesa()}",
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String text, String valor) {
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
            valor,
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
