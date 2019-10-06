import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millenium/src/bloc/personagem_bloc/personagem_bloc.dart';
import 'package:millenium/src/bloc/personagem_bloc/personagem_event.dart';
import 'package:millenium/src/bloc/personagem_bloc/personagem_state.dart';
import 'package:millenium/src/components/app_bar.dart';
import 'package:millenium/src/components/drawer.dart';
import 'package:millenium/src/components/personagem_card.dart';
import 'package:millenium/src/models/atributos.dart';
import 'package:millenium/src/models/personagem.dart';
import 'package:millenium/src/models/usuario.dart';

class PersonagensList extends StatefulWidget {
  final Usuario _usuario;
  final List<Personagem> _personagens;

  PersonagensList({
    @required Usuario usuario,
    @required List<Personagem> personagens,
  })  : assert(usuario != null && personagens != null),
        _usuario = usuario,
        _personagens = personagens;

  @override
  _PersonagensListState createState() => _PersonagensListState();
}

class _PersonagensListState extends State<PersonagensList> {
  PersonagemBloc _bloc;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nomeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<PersonagemBloc>(context);
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(
        usuario: this.widget._usuario,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: widget._personagens.length,
          itemBuilder: (context, index) {
            return PersonagemCard(
              personagem: widget._personagens[index],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Form(
                  key: _formKey,
                  child: Text("Novo Personagem"),
                ),
                content: TextFormField(
                  controller: _nomeController,
                  decoration: InputDecoration(
                    labelText: "Nome",
                    contentPadding: EdgeInsets.all(0),
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
                      _onFormSubmitted();
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  void _onFormSubmitted() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    PersonagemState state =
        BlocProvider.of<PersonagemBloc>(context).currentState;
    bool isValidForm = _formKey.currentState.validate();
    if (!state.isSubmitting && isValidForm) {
      Navigator.of(context).pop();
      _bloc.dispatch(
        FormSubmitted(
          idUsuario: this.widget._usuario.uid,
          nome: _nomeController.text,
          atributos: Atributos(),
        ),
      );
    }
  }
}
