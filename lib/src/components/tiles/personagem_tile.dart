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
    return Card(
      child: ListTile(
        leading: Container(
          child: ImagemPerfil(
            imagem: personagem.imagem,
            backgroundColor: Theme.of(context).primaryColor,
            radius: 32,
            icon: Icon(
              Icons.person_outline,
              size: 40,
            ),
          ),
        ),
        title: _Nome(personagem.nome),
        subtitle: _Titulo(personagem.titulo),
        onTap: onPressed,
      ),
    );
  }
}

class _Nome extends StatelessWidget {
  final String nome;

  _Nome(this.nome);

  @override
  Widget build(BuildContext context) {
    return Text(
      nome,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
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
