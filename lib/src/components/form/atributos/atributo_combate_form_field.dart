import 'package:flutter/material.dart';
import 'package:millenium/src/components/form/atributos/atributo_row.dart';
import 'package:millenium/src/components/utils/custom_divider.dart';
import 'package:millenium/src/models/atributos_combate/atributos_combate.dart';
import 'package:millenium/src/util/descricao_atributos_combate.dart';

class AtributosCombateFormField extends FormField<AtributosCombate> {
  AtributosCombateFormField({
    bool isAdmin,
    @required bool isKarmaUnlocked,
    @required bool isMagiaUnlocked,
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
                      CustomDivider(
                        height: 1,
                        width: double.infinity,
                      ),
                      Text(
                        "Pontos: ${atributos.pontosDistribuicao}",
                        textAlign: TextAlign.center,
                      ),
                      CustomDivider(
                        height: 1,
                        width: double.infinity,
                      ),
                      AtributoRow(
                        text: "Força",
                        descricao: descricao_forca,
                        isAdmin: isAdmin,
                        pontos: atributos.strenght,
                        adicionarPonto: () {
                          bool shouldUpgrade = false;

                          if ((atributos.strenght < 25 || isKarmaUnlocked) &&
                              atributos.pontosDistribuicao > 0) {
                            shouldUpgrade = true;
                          }

                          if (shouldUpgrade) {
                            atributos.strenght++;
                            atributos.pontosDistribuicao--;

                            bool isDivisibleBy5 = atributos.strenght % 5 == 0;
                            bool isNotDivisibleBy25 =
                                atributos.strenght % 25 != 0;

                            if (isDivisibleBy5 && isNotDivisibleBy25) {
                              atributos.strenght += 2;
                            }

                            state.didChange(atributos);
                          }
                        },
                        removerPonto: () {
                          if (atributosBase.strenght < atributos.strenght) {
                            atributos.strenght--;
                            atributos.pontosDistribuicao++;

                            if (atributos.strenght % 6 == 0) {
                              atributos.strenght -= 2;
                              if (atributos.strenght < 0) {
                                atributos.strenght = 0;
                              }
                              state.didChange(atributos);
                            } else {
                              state.didChange(atributos);
                            }
                          }
                        },
                      ),
                      CustomDivider(
                        width: double.infinity,
                        height: 1,
                      ),
                      AtributoRow(
                        isAdmin: isAdmin,
                        text: "Agilidade",
                        descricao: descricao_agilidade,
                        pontos: atributos.agility,
                        adicionarPonto: () {
                          bool shouldUpgrade = false;

                          if ((atributos.agility < 25 || isKarmaUnlocked) &&
                              atributos.pontosDistribuicao > 0) {
                            shouldUpgrade = true;
                          }

                          if (shouldUpgrade) {
                            atributos.agility++;
                            atributos.pontosDistribuicao--;
                            state.didChange(atributos);
                          }
                        },
                        removerPonto: () {
                          if (atributosBase.agility < atributos.agility &&
                              atributos.pontosDistribuicao <
                                  atributosBase.pontosDistribuicao) {
                            atributos.agility--;
                            atributos.pontosDistribuicao++;
                            state.didChange(atributos);
                          }
                        },
                      ),
                      CustomDivider(
                        width: double.infinity,
                        height: 1,
                      ),
                      AtributoRow(
                        isAdmin: isAdmin,
                        text: "Destreza",
                        descricao: descricao_destreza,
                        pontos: atributos.dexterity,
                        adicionarPonto: () {
                          bool shouldUpgrade = false;

                          if ((atributos.dexterity < 25 || isKarmaUnlocked) &&
                              atributos.pontosDistribuicao > 0) {
                            shouldUpgrade = true;
                          }

                          if (shouldUpgrade) {
                            atributos.dexterity++;
                            atributos.pontosDistribuicao--;
                            state.didChange(atributos);
                          }
                        },
                        removerPonto: () {
                          if (atributosBase.dexterity < atributos.dexterity &&
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
                      AtributoRow(
                        isAdmin: isAdmin,
                        text: "Vitalidade",
                        descricao: descricao_vitalidade,
                        pontos: atributos.vitality,
                        adicionarPonto: () {
                          bool shouldUpgrade = false;

                          if ((atributos.vitality < 25 || isKarmaUnlocked) &&
                              atributos.pontosDistribuicao > 0) {
                            shouldUpgrade = true;
                          }

                          if (shouldUpgrade) {
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
                      AtributoRow(
                        isAdmin: isAdmin,
                        text: "Inteligência",
                        descricao: descricao_inteligencia,
                        pontos: atributos.intelligence,
                        adicionarPonto: () {
                          bool shouldUpgrade = false;

                          if ((atributos.intelligence < 25 ||
                                  isKarmaUnlocked) &&
                              isMagiaUnlocked &&
                              atributos.pontosDistribuicao > 0) {
                            shouldUpgrade = true;
                          }

                          if (shouldUpgrade) {
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
                ),
              ),
            );
          },
        );
}
