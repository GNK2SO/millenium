import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_bloc.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_event.dart';
import 'package:millenium/src/models/usuario.dart';
import 'package:millenium/src/repository/personagem_repository.dart';
import 'package:millenium/src/screens/todos_personagens/todos_personagens_form.dart';

///Tela onde o MESTRE visualiza todos os personagens de todos os players
class TodosPersonagensScreen extends StatelessWidget {
  final Usuario _usuario;
  final PersonagemRepository _personagemRepository;

  TodosPersonagensScreen({
    Key key,
    @required Usuario usuario,
    @required PersonagemRepository repository,
  })  : assert(repository != null && usuario != null),
        _usuario = usuario,
        _personagemRepository = repository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PersonagemBloc>(
      builder: (context) => PersonagemBloc(repository: _personagemRepository)
        ..dispatch(ObterTodosPersonagens()),
      child: TodosPersonagensForm(usuario: _usuario),
    );
  }
}
