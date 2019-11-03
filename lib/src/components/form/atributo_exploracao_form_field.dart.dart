import 'package:flutter/material.dart';
import 'package:millenium/src/components/form/atributo_row.dart';
import 'package:millenium/src/components/utils/custom_divider.dart';
import 'package:millenium/src/models/atributos_exploracao/atributos_exploracao.dart';
import 'package:millenium/src/util/descricao_atributos_exploracao.dart';

class AtributosExploracaoFormField extends FormField<AtributosExploracao> {
  AtributosExploracaoFormField({
    bool isAdmin,
    FormFieldSetter<AtributosExploracao> onSaved,
    AtributosExploracao atributos,
    AtributosExploracao atributosBase,
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
                      "Exploração",
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
                          AtributoRow(
                            text: "Carisma",
                            descricao: descricao_carisma,
                            isAdmin: isAdmin,
                            pontos: atributos.carisma,
                            adicionarPonto: () {
                              if (atributos.pontosDistribuicao > 0 &&
                                  atributos.carisma < 8) {
                                atributos.carisma++;
                                atributos.pontosDistribuicao--;
                                state.didChange(atributos);
                              }
                            },
                            removerPonto: () {
                              if (atributosBase.carisma < atributos.carisma) {
                                atributos.carisma--;
                                atributos.pontosDistribuicao++;
                                state.didChange(atributos);
                              }
                            },
                          ),
                          CustomDivider(
                            height: 1,
                          ),
                          AtributoRow(
                            text: "Governação",
                            descricao: descricao_governacao,
                            isAdmin: isAdmin,
                            pontos: atributos.governacao,
                            adicionarPonto: () {
                              if (atributos.pontosDistribuicao > 0 &&
                                  atributos.governacao < 10) {
                                atributos.governacao++;
                                atributos.pontosDistribuicao--;
                                state.didChange(atributos);
                              }
                            },
                            removerPonto: () {
                              if (atributosBase.governacao <
                                  atributos.governacao) {
                                atributos.governacao--;
                                atributos.pontosDistribuicao++;
                                state.didChange(atributos);
                              }
                            },
                          ),
                          CustomDivider(
                            height: 1,
                          ),
                          AtributoRow(
                            text: "Navegação",
                            descricao: descricao_navegacao,
                            isAdmin: isAdmin,
                            pontos: atributos.navegacao,
                            adicionarPonto: () {
                              if (atributos.pontosDistribuicao > 0 &&
                                  atributos.navegacao < 8) {
                                atributos.navegacao++;
                                atributos.pontosDistribuicao--;
                                state.didChange(atributos);
                              }
                            },
                            removerPonto: () {
                              if (atributosBase.navegacao <
                                  atributos.navegacao) {
                                atributos.navegacao--;
                                atributos.pontosDistribuicao++;
                                state.didChange(atributos);
                              }
                            },
                          ),
                          CustomDivider(
                            height: 1,
                          ),
                          AtributoRow(
                            text: "Sobrevivência",
                            descricao: descricao_sobrevivencia,
                            isAdmin: isAdmin,
                            pontos: atributos.sobrevivencia,
                            adicionarPonto: () {
                              if (atributos.pontosDistribuicao > 0 &&
                                  atributos.sobrevivencia < 8) {
                                atributos.sobrevivencia++;
                                atributos.pontosDistribuicao--;
                                state.didChange(atributos);
                              }
                            },
                            removerPonto: () {
                              if (atributosBase.sobrevivencia <
                                  atributos.sobrevivencia) {
                                atributos.sobrevivencia--;
                                atributos.pontosDistribuicao++;
                                state.didChange(atributos);
                              }
                            },
                          ),
                          CustomDivider(
                            height: 1,
                          ),
                          AtributoRow(
                            text: "Comércio",
                            descricao: descricao_comercio,
                            isAdmin: isAdmin,
                            pontos: atributos.comercio,
                            adicionarPonto: () {
                              if (atributos.pontosDistribuicao > 0 &&
                                  atributos.comercio < 8) {
                                atributos.comercio++;
                                atributos.pontosDistribuicao--;
                                state.didChange(atributos);
                              }
                            },
                            removerPonto: () {
                              if (atributosBase.comercio < atributos.comercio) {
                                atributos.comercio--;
                                atributos.pontosDistribuicao++;
                                state.didChange(atributos);
                              }
                            },
                          ),
                          CustomDivider(
                            height: 1,
                          ),
                          AtributoRow(
                            text: "Construção",
                            descricao: descricao_construcao,
                            isAdmin: isAdmin,
                            pontos: atributos.construcao,
                            adicionarPonto: () {
                              if (atributos.pontosDistribuicao > 0 &&
                                  atributos.construcao < 8) {
                                atributos.construcao++;
                                atributos.pontosDistribuicao--;
                                state.didChange(atributos);
                              }
                            },
                            removerPonto: () {
                              if (atributosBase.construcao <
                                  atributos.construcao) {
                                atributos.construcao--;
                                atributos.pontosDistribuicao++;
                                state.didChange(atributos);
                              }
                            },
                          ),
                          CustomDivider(
                            height: 1,
                          ),
                          AtributoRow(
                            text: "Exploração",
                            descricao: descricao_exploracao,
                            isAdmin: isAdmin,
                            pontos: atributos.exploracao,
                            adicionarPonto: () {
                              if (atributos.pontosDistribuicao > 0 &&
                                  atributos.exploracao < 8) {
                                atributos.exploracao++;
                                atributos.pontosDistribuicao--;
                                state.didChange(atributos);
                              }
                            },
                            removerPonto: () {
                              if (atributosBase.exploracao <
                                  atributos.exploracao) {
                                atributos.exploracao--;
                                atributos.pontosDistribuicao++;
                                state.didChange(atributos);
                              }
                            },
                          ),
                          CustomDivider(
                            height: 1,
                          ),
                          AtributoRow(
                            text: "Militarismo",
                            descricao: descricao_militarismo,
                            isAdmin: isAdmin,
                            pontos: atributos.militarismo,
                            adicionarPonto: () {
                              if (atributos.pontosDistribuicao > 0 &&
                                  atributos.militarismo < 10) {
                                atributos.militarismo++;
                                atributos.pontosDistribuicao--;
                                state.didChange(atributos);
                              }
                            },
                            removerPonto: () {
                              if (atributosBase.militarismo <
                                  atributos.militarismo) {
                                atributos.militarismo--;
                                atributos.pontosDistribuicao++;
                                state.didChange(atributos);
                              }
                            },
                          ),
                          CustomDivider(
                            height: 1,
                          ),
                          AtributoRow(
                            text: "Sabedoria",
                            descricao: descricao_sabedoria,
                            isAdmin: isAdmin,
                            pontos: atributos.sabedoria,
                            adicionarPonto: () {
                              if (atributos.pontosDistribuicao > 0 &&
                                  atributos.sabedoria < 8) {
                                atributos.sabedoria++;
                                atributos.pontosDistribuicao--;
                                state.didChange(atributos);
                              }
                            },
                            removerPonto: () {
                              if (atributosBase.sabedoria <
                                  atributos.sabedoria) {
                                atributos.sabedoria--;
                                atributos.pontosDistribuicao++;
                                state.didChange(atributos);
                              }
                            },
                          ),
                          CustomDivider(
                            height: 1,
                          ),
                          AtributoRow(
                            text: "Magia",
                            descricao: descricao_magia,
                            isAdmin: isAdmin,
                            pontos: atributos.magia,
                            adicionarPonto: () {
                              if (atributos.pontosDistribuicao > 0 &&
                                  atributos.magia < 10) {
                                atributos.magia++;
                                atributos.pontosDistribuicao--;
                                state.didChange(atributos);
                              }
                            },
                            removerPonto: () {
                              if (atributosBase.magia < atributos.magia) {
                                atributos.magia--;
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
}
