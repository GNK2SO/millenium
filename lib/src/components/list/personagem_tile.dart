import 'package:flutter/material.dart';
import 'package:millenium/src/models/personagem.dart';
import 'package:millenium/src/models/usuario.dart';

class PersonagemTile extends StatelessWidget {
  final Personagem personagem;
  final Usuario usuario;
  final Function onPressed;

  PersonagemTile({
    @required this.personagem,
    @required this.usuario,
    @required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                Text("Vida: ${personagem.vidaAtual}/${personagem.vidaTotal()}"),
                Text(
                    "Energia: ${personagem.energiaAtual}/${personagem.energiaTotal()}"),
              ],
            ),
            onTap: this.onPressed,
          )
        ],
      ),
    );
  }
}
