import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_bloc.dart';
import 'package:millenium/src/models/personagem/personagem.dart';
import 'package:millenium/src/models/usuario.dart';
import 'package:millenium/src/repository/personagem_repository.dart';
import 'package:millenium/src/screens/personagem_screen/personagem_form.dart';

class PersonagemScreen extends StatelessWidget {
  final PersonagemRepository _personagemRepository;

  PersonagemScreen({
    Key key,
    @required PersonagemRepository repository,
  })  : assert(repository != null),
        _personagemRepository = repository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final List data = ModalRoute.of(context).settings.arguments;
    final Personagem personagem = data[0];
    final Usuario usuario = data[1];
    return BlocProvider<PersonagemBloc>(
      builder: (context) => PersonagemBloc(repository: _personagemRepository),
      child: PersonagemDetalheForm(usuario: usuario, personagem: personagem),
    );
  }
}
