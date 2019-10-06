import 'package:flutter/material.dart';
import 'package:millenium/src/components/custom_divider.dart';
import 'package:millenium/src/models/atributos.dart';

class AtributosFormField extends FormField<Atributos> {
  AtributosFormField({
    FormFieldSetter<Atributos> onSaved,
    FormFieldValidator<Atributos> validator,
    bool autoValidate: false,
    Atributos atributos,
    Atributos atributosBase,
    int pontosDistribuicaoMaximo,
    int pontosDistribuicao,
  }) : super(
          onSaved: onSaved,
          validator: validator,
          autovalidate: autoValidate,
          builder: (state) {
            return Column(
              children: <Widget>[
                Card(
                  child: Container(
                    decoration: BoxDecoration(border: Border.all()),
                    child: ExpansionTile(
                      title: Text(
                        "Atributos",
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
                              "Pontos: $pontosDistribuicao",
                              textAlign: TextAlign.center,
                            ),
                            CustomDivider(
                              height: 1,
                            ),
                            _buildRow(
                              text: "STR",
                              pontos: atributos.strenght,
                              adicionarPonto: () {
                                if (pontosDistribuicao > 0) {
                                  atributos.strenght++;
                                  state.didChange(atributos);
                                  state.didUpdateWidget(AtributosFormField(
                                    atributos: atributos,
                                    atributosBase: atributosBase,
                                    pontosDistribuicao: pontosDistribuicao--,
                                    pontosDistribuicaoMaximo:
                                        pontosDistribuicaoMaximo,
                                  ));
                                }
                              },
                              removerPonto: () {
                                if (atributosBase.strenght <
                                        atributos.strenght &&
                                    pontosDistribuicao <
                                        pontosDistribuicaoMaximo) {
                                  atributos.strenght--;
                                  state.didChange(atributos);
                                  state.didUpdateWidget(AtributosFormField(
                                    atributos: atributos,
                                    atributosBase: atributosBase,
                                    pontosDistribuicao: pontosDistribuicao++,
                                    pontosDistribuicaoMaximo:
                                        pontosDistribuicaoMaximo,
                                  ));
                                }
                              },
                            ),
                            CustomDivider(
                              width: double.infinity,
                              height: 1,
                            ),
                            _buildRow(
                              text: "DEX",
                              pontos: atributos.dexterity,
                              adicionarPonto: () {
                                if (pontosDistribuicao > 0) {
                                  atributos.dexterity++;
                                  state.didChange(atributos);
                                  state.didUpdateWidget(AtributosFormField(
                                    atributos: atributos,
                                    atributosBase: atributosBase,
                                    pontosDistribuicao: pontosDistribuicao--,
                                    pontosDistribuicaoMaximo:
                                        pontosDistribuicaoMaximo,
                                  ));
                                }
                              },
                              removerPonto: () {
                                if (atributosBase.dexterity <
                                        atributos.dexterity &&
                                    pontosDistribuicao <
                                        pontosDistribuicaoMaximo) {
                                  atributos.dexterity--;
                                  state.didChange(atributos);
                                  state.didUpdateWidget(AtributosFormField(
                                    atributos: atributos,
                                    atributosBase: atributosBase,
                                    pontosDistribuicao: pontosDistribuicao++,
                                    pontosDistribuicaoMaximo:
                                        pontosDistribuicaoMaximo,
                                  ));
                                }
                              },
                            ),
                            CustomDivider(
                              width: double.infinity,
                              height: 1,
                            ),
                            _buildRow(
                              text: "VIT",
                              pontos: atributos.vitality,
                              adicionarPonto: () {
                                if (pontosDistribuicao > 0) {
                                  atributos.vitality++;
                                  state.didChange(atributos);
                                  state.didUpdateWidget(AtributosFormField(
                                    atributos: atributos,
                                    atributosBase: atributosBase,
                                    pontosDistribuicao: pontosDistribuicao--,
                                    pontosDistribuicaoMaximo:
                                        pontosDistribuicaoMaximo,
                                  ));
                                }
                              },
                              removerPonto: () {
                                if (atributosBase.vitality <
                                        atributos.vitality &&
                                    pontosDistribuicao <
                                        pontosDistribuicaoMaximo) {
                                  atributos.vitality--;
                                  state.didChange(atributos);
                                  state.didUpdateWidget(AtributosFormField(
                                    atributos: atributos,
                                    atributosBase: atributosBase,
                                    pontosDistribuicao: pontosDistribuicao++,
                                    pontosDistribuicaoMaximo:
                                        pontosDistribuicaoMaximo,
                                  ));
                                }
                              },
                            ),
                            CustomDivider(
                              width: double.infinity,
                              height: 1,
                            ),
                            _buildRow(
                              text: "INT",
                              pontos: atributos.intelligence,
                              adicionarPonto: () {
                                if (pontosDistribuicao > 0) {
                                  atributos.intelligence++;
                                  state.didChange(atributos);
                                  state.didUpdateWidget(AtributosFormField(
                                    atributos: atributos,
                                    atributosBase: atributosBase,
                                    pontosDistribuicao: pontosDistribuicao--,
                                    pontosDistribuicaoMaximo:
                                        pontosDistribuicaoMaximo,
                                  ));
                                }
                              },
                              removerPonto: () {
                                if (atributosBase.intelligence <
                                        atributos.intelligence &&
                                    pontosDistribuicao <
                                        pontosDistribuicaoMaximo) {
                                  atributos.intelligence--;
                                  state.didChange(atributos);
                                  state.didUpdateWidget(AtributosFormField(
                                    atributos: atributos,
                                    atributosBase: atributosBase,
                                    pontosDistribuicao: pontosDistribuicao++,
                                    pontosDistribuicaoMaximo:
                                        pontosDistribuicaoMaximo,
                                  ));
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                state.hasError
                    ? Text(
                        state.errorText,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      )
                    : Container()
              ],
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
                "${pontos}",
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
