import 'package:flutter/material.dart';
import 'package:millenium/src/components/tiles/equipamento_tile.dart';
import 'package:millenium/src/components/utils/custom_divider.dart';
import 'package:millenium/src/models/personagem/personagem.dart';

class EquipamentoCard extends StatefulWidget {
  final Personagem personagem;

  EquipamentoCard({@required this.personagem});

  @override
  _EquipamentoCardState createState() =>
      _EquipamentoCardState(personagem: personagem);
}

class _EquipamentoCardState extends State<EquipamentoCard> {
  Personagem personagem;

  _EquipamentoCardState({@required this.personagem});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(border: Border.all()),
        child: ExpansionTile(
          title: Text(
            "Equipamento",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          children: <Widget>[
            CustomDivider(height: 1, width: double.infinity),
            EquipamentoTile(
              equipamentos: personagem.equipamentos,
              onUnequipped: (item) {
                setState(() {
                  personagem.equipamentos.remove(item);
                  personagem.bolsa.insert(0, item);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
