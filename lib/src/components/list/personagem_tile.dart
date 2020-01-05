import 'package:flutter/material.dart';
import 'package:millenium/src/components/form/imagem/imagem_perfil.dart';
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
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                _Nome(personagem.nome),
                _Titulo(personagem.titulo),
                Row(
                  children: <Widget>[
                    _StatusColumn(
                      vida: personagem.vida,
                      vidaTotal: personagem.vidaTotal(),
                      energia: personagem.energia,
                      energiaTotal: personagem.energiaTotal(),
                      mana: personagem.mana,
                      manaTotal: personagem.manaTotal(),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    _StatusFisicosColumn(
                      dano: personagem.dano(),
                      defesa: personagem.defesa(),
                      resistenciaFrio: personagem.resistenciaFrio(),
                    ),
                  ],
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

class _Nome extends StatelessWidget {
  final String nome;

  _Nome(this.nome);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: MediaQuery.of(context).size.width * 0.5,
      child: Text(
        nome,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _Titulo extends StatelessWidget {
  final String titulo;

  _Titulo(this.titulo);

  @override
  Widget build(BuildContext context) {
    if (titulo.isEmpty) {
      return Container();
    }
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Text(
        titulo,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 20,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}

class _StatusColumn extends StatelessWidget {
  final int vida;
  final int vidaTotal;
  final int energia;
  final int energiaTotal;
  final int mana;
  final int manaTotal;

  _StatusColumn({
    @required this.vida,
    @required this.vidaTotal,
    @required this.energia,
    @required this.energiaTotal,
    @required this.mana,
    @required this.manaTotal,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Vida: "),
            Text("Energia: "),
            Text("Mana: "),
          ],
        ),
        Column(
          children: <Widget>[
            Text("$vida/$vidaTotal"),
            Text("$energia/$energiaTotal"),
            Text("$mana/$manaTotal"),
          ],
        ),
      ],
    );
  }
}

class _StatusFisicosColumn extends StatelessWidget {
  final int dano;
  final int defesa;
  final int resistenciaFrio;

  _StatusFisicosColumn({
    @required this.dano,
    @required this.defesa,
    @required this.resistenciaFrio,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Dano: "),
            Text("Defesa: "),
            Text("Res. Frio: "),
          ],
        ),
        Column(
          children: <Widget>[
            Text("$dano"),
            Text("$defesa"),
            Text("$resistenciaFrio"),
          ],
        ),
      ],
    );
  }
}
