import 'package:flutter/material.dart';
import 'package:millenium/src/components/utils/custom_divider.dart';
import 'package:millenium/src/models/atributos_combate.dart';

class AtributosCombateFormField extends FormField<AtributosCombate> {
  AtributosCombateFormField({
    FormFieldSetter<AtributosCombate> onSaved,
    AtributosCombate atributos,
    AtributosCombate atributosBase,
  }) : super(
          onSaved: onSaved,
          builder: (state) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Card(
                child: Container(
                  decoration: BoxDecoration(border: Border.all()),
                  child: ExpansionTile(
                    title: Text(
                      "Combate",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomDivider(
                            height: 1,
                          ),
                          Text(
                            "Pontos: ${atributos.pontosDistribuicao}",
                            textAlign: TextAlign.center,
                          ),
                          CustomDivider(
                            height: 1,
                          ),
                          _buildRow(
                            text: "Força",
                            pontos: atributos.strenght,
                            adicionarPonto: () {
                              if (atributos.pontosDistribuicao > 0) {
                                atributos.strenght++;
                                atributos.pontosDistribuicao--;
                                state.didChange(atributos);
                              }
                            },
                            removerPonto: () {
                              if (atributosBase.strenght < atributos.strenght) {
                                atributos.strenght--;
                                atributos.pontosDistribuicao++;
                                state.didChange(atributos);
                              }
                            },
                          ),
                          CustomDivider(
                            width: double.infinity,
                            height: 1,
                          ),
                          _buildRow(
                            text: "Destreza",
                            pontos: atributos.dexterity,
                            adicionarPonto: () {
                              if (atributos.pontosDistribuicao > 0) {
                                atributos.dexterity++;
                                atributos.pontosDistribuicao--;
                                state.didChange(atributos);
                              }
                            },
                            removerPonto: () {
                              if (atributosBase.dexterity <
                                      atributos.dexterity &&
                                  atributos.pontosDistribuicao <
                                      atributosBase.pontosDistribuicao) {
                                atributos.dexterity--;
                                atributos.pontosDistribuicao++;
                                state.didChange(atributos);
                              }
                            },
                          ),
                          CustomDivider(
                            width: double.infinity,
                            height: 1,
                          ),
                          _buildRow(
                            text: "Vitalidade",
                            pontos: atributos.vitality,
                            adicionarPonto: () {
                              if (atributos.pontosDistribuicao > 0) {
                                atributos.vitality++;
                                atributos.pontosDistribuicao--;
                                state.didChange(atributos);
                              }
                            },
                            removerPonto: () {
                              if (atributosBase.vitality < atributos.vitality &&
                                  atributos.pontosDistribuicao <
                                      atributosBase.pontosDistribuicao) {
                                atributos.vitality--;
                                atributos.pontosDistribuicao++;
                                state.didChange(atributos);
                              }
                            },
                          ),
                          CustomDivider(
                            width: double.infinity,
                            height: 1,
                          ),
                          _buildRow(
                            text: "Inteligência",
                            pontos: atributos.intelligence,
                            adicionarPonto: () {
                              if (atributos.pontosDistribuicao > 0) {
                                atributos.intelligence++;
                                atributos.pontosDistribuicao--;
                                state.didChange(atributos);
                              }
                            },
                            removerPonto: () {
                              if (atributosBase.intelligence <
                                      atributos.intelligence &&
                                  atributos.pontosDistribuicao <
                                      atributosBase.pontosDistribuicao) {
                                atributos.intelligence--;
                                atributos.pontosDistribuicao++;
                                state.didChange(atributos);
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );

  static Widget _buildRow({text, pontos, adicionarPonto, removerPonto}) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(children: <Widget>[
            Expanded(
              flex: 3,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.remove),
                onPressed: removerPonto,
              ),
            ),
            Expanded(
              child: Text(
                "$pontos",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.add),
                onPressed: adicionarPonto,
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
