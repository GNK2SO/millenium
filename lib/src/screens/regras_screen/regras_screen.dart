import 'package:flutter/material.dart';
import 'package:millenium/src/models/usuario.dart';
import 'package:millenium/src/util/regras_millenium.dart';

class RegrasScreen extends StatelessWidget {
  final Usuario usuario;

  RegrasScreen({@required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Como funciona?")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _Titulo(texto: "Ficha básica"),
              _Paragrafo(texto: fichaBasica),
              _Titulo(texto: "Combate"),
              _Paragrafo(texto: combate),
              _Titulo(texto: "Ganho de experiência"),
              _Paragrafo(texto: xp),
              _Titulo(texto: "NPC's"),
              _Paragrafo(texto: npcs),
              _Titulo(texto: "Animais, feras e monstros"),
              _Paragrafo(texto: monstros),
              _Titulo(texto: "Exploração"),
              _Paragrafo(texto: exploracao),
              _Titulo(texto: "Eventos de viagem"),
              _Paragrafo(texto: eventoViagem),
              _Titulo(texto: "Eventos Gerais"),
              _Paragrafo(texto: eventoGeral),
              _Titulo(texto: "Eventos especiais e Classificação Territorial"),
              _Paragrafo(texto: eventoEspecial),
              _Titulo(texto: "Fome"),
              _Paragrafo(texto: fome),
              _Titulo(texto: "Clima"),
              _Paragrafo(texto: clima),
              _Titulo(texto: "Itens"),
              _Paragrafo(texto: itens),
            ],
          ),
        ),
      ),
    );
  }
}

class _Titulo extends StatelessWidget {
  final String texto;

  _Titulo({this.texto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        texto,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _Paragrafo extends StatelessWidget {
  final String texto;

  _Paragrafo({this.texto});

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: TextStyle(
        fontSize: 16,
      ),
    );
  }
}
