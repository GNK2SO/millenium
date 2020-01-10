import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millenium/src/blocs/classe_bloc/classe_bloc.dart';
import 'package:millenium/src/blocs/classe_bloc/classe_event.dart';
import 'package:millenium/src/blocs/classe_bloc/classe_state.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_bloc.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_event.dart';
import 'package:millenium/src/models/classe/classe.dart';
import 'package:millenium/src/models/habilidade/habilidade.dart';
import 'package:millenium/src/models/personagem/personagem.dart';
import 'package:millenium/src/screens/loading_screen.dart';

class CadastroClasseForm extends StatefulWidget {
  final BuildContext contextPage;
  final Personagem personagem;

  CadastroClasseForm({
    @required this.contextPage,
    @required this.personagem,
  });

  @override
  _CadastroClasseFormState createState() =>
      _CadastroClasseFormState(personagem: personagem);
}

class _CadastroClasseFormState extends State<CadastroClasseForm> {
  Personagem personagem;
  _CadastroClasseFormState({@required this.personagem});

  List<Classe> classes;
  String classeSelected;
  List<Habilidade> habilidades;

  @override
  void initState() {
    super.initState();
    classeSelected = personagem.classe;

    BlocProvider.of<ClasseBloc>(widget.contextPage).add(ObterClasses());
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Classes"),
      content: SizedBox(
        height: 50,
        child: BlocBuilder<ClasseBloc, ClasseState>(
          builder: (context, state) {
            if (state is ClassesCarregadas) {
              return DropdownButton<String>(
                isExpanded: true,
                value: classeSelected,
                items: state.classes.map<DropdownMenuItem<String>>((classe) {
                  return DropdownMenuItem<String>(
                    value: classe.nome,
                    child: Text(classe.nome),
                  );
                }).toList()
                  ..insert(
                      0,
                      DropdownMenuItem<String>(
                        value: "",
                        child: Text("Sem Classe"),
                      )),
                onChanged: (classe) {
                  setState(() {
                    classeSelected = classe;
                    if (classeSelected.isNotEmpty) {
                      habilidades = state.classes
                          .singleWhere(
                              (classe) => classe.nome == classeSelected)
                          .habilidades;
                    } else {
                      habilidades = [];
                    }
                  });
                },
              );
            } else if (state is ClasseCarregando) {
              return LoadingScreen();
            } else {
              return Container();
            }
          },
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
            personagem.classe = classeSelected;
            personagem.habilidades = habilidades;
            _submitForm(widget.contextPage);
          },
        )
      ],
    );
  }

  void _submitForm(BuildContext context) {
    Navigator.of(context).pop();
    BlocProvider.of<PersonagemBloc>(context).add(
      AtualizarPersonagem(personagem: widget.personagem),
    );
  }
}
