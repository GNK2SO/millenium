import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_bloc.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_event.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_state.dart';
import 'package:millenium/src/components/app_bar.dart';
import 'package:millenium/src/components/list/personagem_tile.dart';
import 'package:millenium/src/components/utils/custom_divider.dart';
import 'package:millenium/src/components/drawer.dart';
import 'package:millenium/src/models/personagem.dart';
import 'package:millenium/src/models/usuario.dart';
import 'package:millenium/src/screens/error_screen.dart';
import 'package:millenium/src/screens/loading_screen.dart';
import 'package:millenium/src/util/util.dart';

class TodosPersonagensForm extends StatefulWidget {
  final Usuario _usuario;

  TodosPersonagensForm({@required Usuario usuario})
      : assert(usuario != null),
        _usuario = usuario;

  @override
  _TodosPersonagensFormState createState() => _TodosPersonagensFormState();
}

class _TodosPersonagensFormState extends State<TodosPersonagensForm> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<PersonagemBloc, PersonagemState>(
      listener: (context, state) {
        if (state is Success) {
          if (state.mensagem.isNotEmpty) {
            showMessage(key: _scaffoldKey, mensagem: state.mensagem);
          }
          BlocProvider.of<PersonagemBloc>(context)
              .dispatch(ObterTodosPersonagens());
        } else if (state is Failure) {
          showMessage(
            key: _scaffoldKey,
            mensagem: state.erro,
          );
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(),
        drawer: CustomDrawer(
          usuario: this.widget._usuario,
        ),
        body: BlocBuilder<PersonagemBloc, PersonagemState>(
          builder: (context, state) {
            if (state is PersonagensLoaded) {
              List<Personagem> personagens = state.personagens;
              return ListView.separated(
                itemCount: personagens.length,
                itemBuilder: (context, index) {
                  return PersonagemTile(
                    personagem: personagens[index],
                    usuario: this.widget._usuario,
                    onPressed: () async {
                      await Navigator.of(context).pushNamed("/personagemScreen",
                          arguments: [
                            personagens[index],
                            this.widget._usuario
                          ]);
                      BlocProvider.of<PersonagemBloc>(context)
                          .dispatch(ObterTodosPersonagens());
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return CustomDivider(height: 1);
                },
              );
            } else if (state is Loading) {
              return LoadingScreen();
            } else {
              return ErroScreen();
            }
          },
        ),
      ),
    );
  }
}
