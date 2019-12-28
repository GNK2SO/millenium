import 'package:flutter/material.dart';
import 'package:millenium/src/components/form/imagem_perfil.dart';
import 'package:millenium/src/models/personagem/personagem.dart';
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
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ImagemPerfil(
                imagem: personagem.imagem,
                backgroundColor: Theme.of(context).primaryColor,
                radius: 40,
                icon: Icon(
                  Icons.person_outline,
                  size: 40,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    personagem.nome,
                    style: TextStyle(fontSize: 24),
                    overflow: TextOverflow.fade,
                  ),
                ),
                Text(
                  "Vida: ${personagem.vidaAtual}/${personagem.vidaTotal()}",
                ),
                Text(
                  "Energia: ${personagem.energiaAtual}/${personagem.energiaTotal()}",
                ),
                Text(
                  "Mana: ${personagem.manaAtual}/${personagem.manaTotal()}",
                ),
              ],
            )
          ],
        ),
      ),
      onTap: this.onPressed,
    );
  }
}
