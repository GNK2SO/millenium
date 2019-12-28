import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_bloc.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_event.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_state.dart';
import 'package:millenium/src/components/app_bar.dart';
import 'package:millenium/src/components/list/personagem_tile.dart';
import 'package:millenium/src/components/utils/custom_divider.dart';
import 'package:millenium/src/components/drawer.dart';
import 'package:millenium/src/models/personagem/personagem.dart';
import 'package:millenium/src/models/usuario.dart';
import 'package:millenium/src/screens/error_screen.dart';
import 'package:millenium/src/screens/loading_screen.dart';

import '../personagem_screen/personagem_screen.dart';

class HomeScreenAdmin extends StatefulWidget {
  final Usuario _usuario;

  HomeScreenAdmin({@required Usuario usuario})
      : assert(usuario != null),
        _usuario = usuario;

  @override
  _HomeScreenAdmin createState() => _HomeScreenAdmin(usuario: this._usuario);
}

class _HomeScreenAdmin extends State<HomeScreenAdmin> {
  final Usuario usuario;
  _HomeScreenAdmin({@required this.usuario});

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PersonagemBloc>(context).add(ObterTodosPersonagens());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PersonagemBloc, PersonagemState>(
      listener: (context, state) {
        if (state is PersonagemSuccess) {
          BlocProvider.of<PersonagemBloc>(context).add(ObterTodosPersonagens());
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(),
        drawer: CustomDrawer(
          usuario: usuario,
        ),
        body: BlocBuilder<PersonagemBloc, PersonagemState>(
          builder: (context, state) {
            if (state is PersonagensCarregado) {
              List<Personagem> personagens = state.personagens;
              return ListView.separated(
                itemCount: personagens.length,
                itemBuilder: (context, index) {
                  return PersonagemTile(
                    personagem: personagens[index],
                    usuario: usuario,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PersonagemScreen(
                            usuario: usuario,
                            personagem: personagens[index],
                          ),
                        ),
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return CustomDivider(height: 1);
                },
              );
            } else if (state is PersonagemCarregando) {
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
