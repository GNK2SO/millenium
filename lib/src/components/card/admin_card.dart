import 'package:flutter/material.dart';
import 'package:millenium/src/components/form/karma_form_field.dart';
import 'package:millenium/src/components/form/ponto_distribuicao_form_field.dart';
import 'package:millenium/src/components/utils/custom_divider.dart';
import 'package:millenium/src/models/personagem/personagem.dart';

class AdminCard extends StatelessWidget {
  final bool isAdmin;
  final Personagem personagem;
  AdminCard({@required this.isAdmin, @required this.personagem});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isAdmin,
      child: Card(
        child: Container(
          decoration: BoxDecoration(border: Border.all()),
          child: ExpansionTile(
            title: Text(
              "Admin",
              style: TextStyle(fontSize: 24),
            ),
            children: <Widget>[
              CustomDivider(
                height: 1,
                width: double.infinity,
              ),
              PontosDitribuicaoFormField(
                text: "Pts. Combate",
                pontosDistribuicao:
                    personagem.atributosCombate.pontosDistribuicao,
                onSaved: (pontosDistribuicao) {
                  if (pontosDistribuicao != null) {
                    personagem.atributosCombate.pontosDistribuicao =
                        pontosDistribuicao;
                  }
                },
              ),
              CustomDivider(height: 1, width: double.infinity),
              PontosDitribuicaoFormField(
                text: "Pts. Exploração",
                pontosDistribuicao:
                    personagem.atributosExploracao.pontosDistribuicao,
                onSaved: (pontosDistribuicao) {
                  if (pontosDistribuicao != null) {
                    personagem.atributosExploracao.pontosDistribuicao =
                        pontosDistribuicao;
                  }
                },
              ),
              CustomDivider(height: 1, width: double.infinity),
              KarmaFormField(
                text: "Karma",
                karma: personagem.karma,
                onSaved: (karma) {
                  personagem.karma = karma;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
