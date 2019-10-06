import 'package:flutter/material.dart';
import 'package:millenium/src/models/personagem.dart';

class PersonagemCard extends StatelessWidget {
  final Personagem personagem;

  PersonagemCard({this.personagem});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              radius: 40,
            ),
            title: Text(
              personagem.nome,
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Vida: 100/${personagem.vida}"),
                Text("Energia: 30/${personagem.energia}"),
              ],
            ),
            onTap: () {
              Navigator.of(context).pushNamed("/personagemScreen");
            },
          )
        ],
      ),
    );
  }
}
