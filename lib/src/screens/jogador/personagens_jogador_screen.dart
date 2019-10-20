import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:millenium/src/blocs/personagem_bloc.dart';
import 'package:millenium/src/components/app_bar.dart';
import 'package:millenium/src/components/list/personagem_tile.dart';
import 'package:millenium/src/components/utils/custom_divider.dart';
import 'package:millenium/src/components/drawer.dart';
import 'package:millenium/src/components/form/text_field.dart';
import 'package:millenium/src/models/page_state.dart';
import 'package:millenium/src/models/page_state_info.dart';
import 'package:millenium/src/models/personagem.dart';
import 'package:millenium/src/models/usuario.dart';
import 'package:millenium/src/util/util.dart';
import 'package:millenium/src/validators/usuario_validator.dart';

class PersonagensJogadorScreen extends StatefulWidget {
  final Usuario _usuario;

  PersonagensJogadorScreen({@required Usuario usuario})
      : assert(usuario != null),
        _usuario = usuario;

  @override
  _PersonagensJogadorScreenState createState() =>
      _PersonagensJogadorScreenState();
}

class _PersonagensJogadorScreenState extends State<PersonagensJogadorScreen> {
  final _bloc = BlocProvider.getBloc<PersonagemBloc>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    _bloc.stateStream.listen(
      (pageState) {
        if (pageState.message != null) {
          showMessage(
            key: _scaffoldKey,
            mensagem: pageState.message,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(),
      drawer: CustomDrawer(
        usuario: this.widget._usuario,
      ),
      body: StreamBuilder(
        stream: _bloc.obterMeusPersonagens(this.widget._usuario.uid),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              if (snapshot.hasData) {
                List<Personagem> personagens =
                    _bloc.mapToList(documents: snapshot.data.documents);

                return ListView.separated(
                  itemCount: personagens.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: Key(personagens[index].nome),
                      child: PersonagemTile(
                        personagem: personagens[index],
                        usuario: this.widget._usuario,
                      ),
                      background: Container(
                        color: Colors.red,
                      ),
                      onDismissed: (_) {
                        _bloc.remover(personagens[index]);
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return CustomDivider(height: 1);
                  },
                );
              }
              return Container();
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return StreamBuilder<PageStateInfo>(
                stream: _bloc.stateStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return PersonagemForm(
                      bloc: _bloc,
                      formKey: _formKey,
                      state: snapshot.data.state,
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class PersonagemForm extends StatelessWidget with UsuarioValidator {
  final PersonagemBloc bloc;
  final GlobalKey<FormState> formKey;
  final PageState state;

  PersonagemForm({this.bloc, this.formKey, this.state});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Novo Personagem"),
      content: Form(
        key: formKey,
        child: CustomTextField(
          padding: EdgeInsets.all(0),
          stream: bloc.nomeStream,
          sink: bloc.nomeSink,
          labelText: "Nome",
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
            _onFormSubmitted(context, state);
          },
        ),
      ],
    );
  }

  void _onFormSubmitted(BuildContext context, PageState state) {
    bool isFormValidate = formKey.currentState.validate();

    if (state != PageState.LOADING && isFormValidate) {
      Navigator.of(context).pop();
      bloc.salvarPersonagem();
    }
  }
}
