import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                    child: IconButton(
                      icon: karma
                          ? Icon(FontAwesomeIcons.solidCircle)
                          : Icon(FontAwesomeIcons.circle),
                      onPressed: () {
                        karma = !karma;
                        state.didChange(karma);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
}
