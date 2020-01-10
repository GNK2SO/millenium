import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_bloc.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_event.dart';
import 'package:millenium/src/components/form/input/text_input.dart';
import 'package:millenium/src/models/personagem/personagem.dart';
import 'package:millenium/src/validators/personagem_validator.dart';

class CadastroTituloForm extends StatelessWidget with PersonagemValidator {
  final BuildContext contextPage;
  final Personagem personagem;

  CadastroTituloForm({
    @required this.contextPage,
    @required this.personagem,
  });

  final _tituloController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Titulo"),
      content: Form(
        key: _formKey,
        child: TextInput(
          padding: const EdgeInsets.all(0),
          labelText: "Título",
          controller: _tituloController,
          validator: isValidTitulo,
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            "Voltar",
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
            "Salvar",
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
      personagem.titulo = _tituloController.text;
      BlocProvider.of<PersonagemBloc>(context).add(
        AtualizarPersonagem(personagem: personagem),
      );
    }
  }
}
