import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millenium/src/components/card/card_row.dart';
import 'package:millenium/src/components/form/input/text_input.dart';
import 'package:millenium/src/models/personagem/personagem.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_bloc.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_event.dart';
import 'package:millenium/src/util/theme.dart';

class InfoCard extends StatelessWidget {
  final Personagem personagem;
  final bool isAdmin;
  InfoCard({@required this.personagem, @required this.isAdmin});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        child: Container(
          decoration: BoxDecoration(border: Border.all()),
          child: ExpansionTile(
            title: Text(
              "Info",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            children: <Widget>[
              Column(
                children: [
                  CardRow(text: "Raça", valor: "Humano"),
                  GestureDetector(
                    child: CardRow(text: "Classe", valor: "-"),
                  ),
                  GestureDetector(
                    child: CardRow(text: "Título", valor: _getTitulo()),
                    onTap: isAdmin
                        ? () {
                            _exibirPopupTituloForm(context);
                          }
                        : null,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _exibirPopupTituloForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return _TituloForm(
          contextPage: context,
          personagem: personagem,
        );
      },
    );
  }

  String _getTitulo() {
    if (personagem.titulo.isEmpty) {
      return "-";
    }
    return personagem.titulo;
  }
}

class _TituloForm extends StatelessWidget {
  final BuildContext contextPage;
  final Personagem personagem;

  _TituloForm({
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
              color: primaryColor,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        RaisedButton(
          color: primaryColor,
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

  String isValidTitulo(String tituloPersonagen) {
    if (tituloPersonagen == null) {
      return "Campo obrigatório!";
    }
    if (tituloPersonagen.length > 22) {
      return "Tamanho máximo de 22 caracteres!";
    }
    return null;
  }
}
