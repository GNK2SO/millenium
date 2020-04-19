import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_bloc.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_event.dart';
import 'package:millenium/src/components/form/input/text_input.dart';

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
        child: TextInput(
          padding: const EdgeInsets.all(0),
          labelText: "Nome",
          controller: _nomeController,
          validator: isValidNome,
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            "Cancelar",
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).primaryColor,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        RaisedButton(
          color: Theme.of(context).primaryColor,
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

  String isValidNome(String nomePersonagen) {
    if (nomePersonagen == null || nomePersonagen.isEmpty) {
      return "Campo obrigatório!";
    }
    return null;
  }
}
