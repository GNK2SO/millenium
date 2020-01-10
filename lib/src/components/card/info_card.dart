import 'package:flutter/material.dart';
import 'package:millenium/src/components/alert_form/cadastro_classe_form.dart';
import 'package:millenium/src/components/alert_form/cadastro_titulo_form.dart';
import 'package:millenium/src/components/card/card_row.dart';
import 'package:millenium/src/models/personagem/personagem.dart';

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
                    child: CardRow(text: "Classe", valor: _getClasse()),
                    onTap: isAdmin
                        ? () {
                            _exibirPopupClasseForm(context);
                          }
                        : null,
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

  void _exibirPopupClasseForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return CadastroClasseForm(
          contextPage: context,
          personagem: personagem,
        );
      },
    );
  }

  String _getClasse() {
    if (personagem.classe.isEmpty) {
      return "-";
    }
    return personagem.classe;
  }

  void _exibirPopupTituloForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return CadastroTituloForm(
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
