import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_bloc.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_event.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_state.dart';
import 'package:millenium/src/components/form/personagem/personagem_form.dart';
import 'package:millenium/src/components/tiles/personagem_tile.dart';
import 'package:millenium/src/components/utils/custom_divider.dart';
import 'package:millenium/src/components/drawer.dart';
import 'package:millenium/src/models/personagem/personagem.dart';
import 'package:millenium/src/models/usuario.dart';
import 'package:millenium/src/screens/error_screen.dart';
import 'package:millenium/src/screens/loading_screen.dart';
import 'package:millenium/src/util/util.dart';

import '../personagem_screen/personagem_screen.dart';

class HomeScreen extends StatefulWidget {
  final Usuario _usuario;

  HomeScreen({@required Usuario usuario})
      : assert(usuario != null),
        _usuario = usuario;

  @override
  _HomeScreenState createState() => _HomeScreenState(usuario: this._usuario);
}

class _HomeScreenState extends State<HomeScreen> {
  final Usuario usuario;
  _HomeScreenState({@required this.usuario});

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    obterMeusPersonagens();
  }

  void obterMeusPersonagens() {
    BlocProvider.of<PersonagemBloc>(context).add(
      ObterMeusPersonagens(uid: usuario.uid),
    );
  }

  void personagemListener(BuildContext context, PersonagemState state) {
    if (state is PersonagemSuccess) {
      obterMeusPersonagens();
    }
    if (state is PersonagemRemovido) {
      showMessage(key: _scaffoldKey, mensagem: state.mensagem);
      obterMeusPersonagens();
    }
    if (state is PersonagemFailure) {
      showMessage(key: _scaffoldKey, mensagem: state.erro);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PersonagemBloc, PersonagemState>(
      listener: personagemListener,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(title: Text("Personagens")),
        drawer: CustomDrawer(usuario: usuario),
        body: BlocBuilder<PersonagemBloc, PersonagemState>(
          builder: (context, state) {
            if (state is PersonagensCarregado) {
              List<Personagem> personagens = state.personagens;
              return ListView.separated(
                itemCount: personagens.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(personagens[index].nome),
                    child: PersonagemTile(
                      personagem: personagens[index],
                      usuario: usuario,
                      onPressed: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PersonagemScreen(
                              usuario: usuario,
                              personagem: personagens[index],
                            ),
                          ),
                        );
                        BlocProvider.of<PersonagemBloc>(context).add(
                          ObterMeusPersonagens(uid: usuario.uid),
                        );
                      },
                    ),
                    background: Container(color: Colors.red),
                    onDismissed: (_) {
                      BlocProvider.of<PersonagemBloc>(context).add(
                        RemoverPersonagem(personagem: personagens[index]),
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
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showDialog(
              context: context,
              builder: (dialogContext) {
                return PersonagemForm(contextPage: context);
              },
            );
          },
        ),
      ),
    );
  }
}
