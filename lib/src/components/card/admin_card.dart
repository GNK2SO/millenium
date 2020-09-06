import 'package:flutter/material.dart';
import 'package:millenium/src/components/form/karma_form_field.dart';
import 'package:millenium/src/components/form/ponto_distribuicao_form_field.dart';
import 'package:millenium/src/components/utils/custom_divider.dart';
import 'package:millenium/src/models/personagem/personagem.dart';

class AdminCard extends StatelessWidget {
  final Personagem personagem;
  AdminCard({@required this.personagem});

  @override
  Widget build(BuildContext context) {
    return Card(
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
              pontosDistribuicao: personagem.pontosDistribuicaoCombate,
              onSaved: (pontosDistribuicao) {
                personagem.setPontoDistribuicaoCombate(pontosDistribuicao);
              },
            ),
            CustomDivider(height: 1, width: double.infinity),
            PontosDitribuicaoFormField(
              text: "Pts. Exploração",
              pontosDistribuicao: personagem.pontosDistribuicaoExploracao,
              onSaved: (pontosDistribuicao) {
                personagem.setPontoDistribuicaoExploracao(pontosDistribuicao);
              },
            ),
            Visibility(
              visible: personagem.classe.isNotEmpty,
              child: Column(
                children: <Widget>[
                  CustomDivider(height: 1, width: double.infinity),
                  PontosDitribuicaoFormField(
                    text: "Pts. Habilidade",
                    pontosDistribuicao: personagem.pontosHabilidade,
                    onSaved: (pontosDistribuicao) {
                      personagem.setPontoHabilidade(pontosDistribuicao);
                    },
                  ),
                ],
              ),
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
    );
  }
}
