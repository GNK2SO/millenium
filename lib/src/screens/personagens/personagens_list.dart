import 'package:flutter/material.dart';
import 'package:millenium/src/components/app_bar.dart';
import 'package:millenium/src/components/drawer.dart';
import 'package:millenium/src/components/personagem_card.dart';
import 'package:millenium/src/models/personagem.dart';
import 'package:millenium/src/models/usuario.dart';

class PersonagensList extends StatelessWidget {
  final Usuario _usuario;
  final List<Personagem> _personagens;
  PersonagensList(
      {@required Usuario usuario, @required List<Personagem> personagens})
      : assert(usuario != null && personagens != null),
        _usuario = usuario,
        _personagens = personagens;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(
        usuario: this._usuario,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: _personagens.length,
          itemBuilder: (context, index) {
            return PersonagemCard(
              personagem: _personagens[index],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed("/cadastroPersonagemScreen");
        },
      ),
    );
  }
}
