import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millenium/src/bloc/personagem_bloc/personagem_bloc.dart';
import 'package:millenium/src/models/personagem.dart';
import 'package:millenium/src/models/usuario.dart';
import 'package:millenium/src/screens/personagens/personagens_list.dart';

class PersonagensScreen extends StatefulWidget {
  @override
  _PersonagensScreenState createState() => _PersonagensScreenState();
}

class _PersonagensScreenState extends State<PersonagensScreen> {
  Usuario usuario;

  List<Personagem> personagens = [
    Personagem(nome: "Zaikay Sevensky", vida: 79, energia: 13),
    Personagem(nome: "Zaikay Sevensky", vida: 79, energia: 13),
    Personagem(nome: "Zaikay Sevensky", vida: 79, energia: 13),
    Personagem(nome: "Zaikay Sevensky", vida: 79, energia: 13),
  ];

  @override
  Widget build(BuildContext context) {
    usuario = ModalRoute.of(context).settings.arguments;
    return BlocProvider<PersonagemBloc>(
      builder: (context) => PersonagemBloc(),
      child: PersonagensList(
        usuario: usuario,
        personagens: personagens,
      ),
    );
  }
}
