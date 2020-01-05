import 'package:flutter/material.dart';
import 'package:millenium/src/util/theme.dart';

class KarmaFormField extends FormField<bool> {
  KarmaFormField({
    String text,
    bool karma,
    FormFieldSetter<bool> onSaved,
  }) : super(
          onSaved: onSaved,
          builder: (state) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48.0),
                      child: Switch(
                        activeColor: primaryColor,
                        value: karma,
                        onChanged: (newValue) {
                          karma = newValue;
                          state.didChange(karma);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
}
