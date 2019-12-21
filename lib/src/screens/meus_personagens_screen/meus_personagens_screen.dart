import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_bloc.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_event.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_state.dart';
import 'package:millenium/src/components/app_bar.dart';
import 'package:millenium/src/components/list/personagem_tile.dart';
import 'package:millenium/src/components/utils/custom_divider.dart';
import 'package:millenium/src/components/drawer.dart';
import 'package:millenium/src/components/form/text_field.dart';
import 'package:millenium/src/models/personagem/personagem.dart';
import 'package:millenium/src/models/usuario.dart';
import 'package:millenium/src/screens/error_screen.dart';
import 'package:millenium/src/screens/loading_screen.dart';
import 'package:millenium/src/util/util.dart';

import '../personagem_screen/personagem_screen.dart';

class MeusPersonagensScreen extends StatefulWidget {
  final Usuario _usuario;

  MeusPersonagensScreen({@required Usuario usuario})
      : assert(usuario != null),
        _usuario = usuario;

  @override
  _MeusPersonagensScreenState createState() =>
      _MeusPersonagensScreenState(usuario: this._usuario);
}

class _MeusPersonagensScreenState extends State<MeusPersonagensScreen> {
  final Usuario usuario;
  _MeusPersonagensScreenState({@required this.usuario});

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PersonagemBloc>(context)
        .add(ObterMeusPersonagens(uid: usuario.uid));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PersonagemBloc, PersonagemState>(
      listener: (context, state) {
        if (state is PersonagemRemovido) {
          showMessage(key: _scaffoldKey, mensagem: state.mensagem);
          BlocProvider.of<PersonagemBloc>(context)
              .add(ObterMeusPersonagens(uid: usuario.uid));
        }
        if (state is Success) {
          BlocProvider.of<PersonagemBloc>(context)
              .add(ObterMeusPersonagens(uid: usuario.uid));
        } else if (state is Failure) {
          showMessage(
            key: _scaffoldKey,
            mensagem: state.erro,
          );
        }
      },
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
                          ObterMeusPersonagens(
                            uid: usuario.uid,
                          ),
                        );
                      },
                    ),
                    background: Container(
                      color: Colors.red,
                    ),
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
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(Icons.add),
          onPressed: () {
            showDialog(
              context: context,
              builder: (dialogContext) {
                return PersonagemForm(
                  contextPage: context,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class PersonagemForm extends StatelessWidget {
  final _nomeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final BuildContext contextPage;

  PersonagemForm({this.contextPage});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Novo Personagem"),
      content: Form(
        key: _formKey,
        child: CustomTextField(
          padding: EdgeInsets.all(0),
          labelText: "Nome",
          controller: _nomeController,
          validator: (nome) {
            if (nome.isEmpty) {
              return "Campo obrigatório!";
            }
            return null;
          },
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            "Cancelar",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text(
            "Cadastrar",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          onPressed: () {
            _submitForm(contextPage);
          },
        )
      ],
    );
  }

  void _submitForm(BuildContext context) {
    if (_formKey.currentState.validate()) {
      Navigator.of(context).pop();
      BlocProvider.of<PersonagemBloc>(context)
          .add(SalvarPersonagem(nome: _nomeController.text));
    }
  }
}
