import 'package:flutter/material.dart';
import 'package:millenium/src/components/card/card_row.dart';
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
                children: [
                  CardRow(
                    text: "Dano",
                    valor: "${personagem.dano()}",
                  ),
                  CardRow(
                    text: "Defesa",
                    valor: "${personagem.defesa()}",
                  ),
                  CardRow(
                    text: "Res. Frio",
                    valor: "${personagem.resistenciaFrio()}",
                  ),
                  CardRow(
                    text: "Esquiva",
                    valor: "${personagem.chanceEsquiva()}",
                  ),
                  CardRow(
                    text: "Crítico",
                    valor: "${personagem.chanceAcertoCritico()}",
                  ),
                  CardRow(
                    text: "Vida",
                    valor: "${personagem.vida}/${personagem.vidaTotal()}",
                  ),
                  CardRow(
                    text: "Energia",
                    valor: "${personagem.energia}/${personagem.energiaTotal()}",
                  ),
                  CardRow(
                    text: "Mana",
                    valor: "${personagem.mana}/${personagem.mana}",
                  ),
                  CardRow(
                    text: "Fome",
                    valor: "${personagem.fome}",
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
