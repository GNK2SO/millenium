import 'package:flutter/material.dart';

class PontosDitribuicaoFormField extends FormField<int> {
  PontosDitribuicaoFormField({
    String text,
    int pontosDistribuicao,
    FormFieldSetter<int> onSaved,
  }) : super(
          onSaved: onSaved,
          builder: (state) {
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
                        onPressed: () {
                          if (pontosDistribuicao > 0) {
                            pontosDistribuicao--;
                          }
                          state.didChange(pontosDistribuicao);
                        },
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "$pontosDistribuicao",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          pontosDistribuicao++;
                          state.didChange(pontosDistribuicao);
                        },
                      ),
                    ),
                  ]),
                ),
              ],
            );
          },
        );
}
