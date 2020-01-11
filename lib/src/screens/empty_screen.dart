import 'package:flutter/material.dart';
import 'package:millenium/src/util/theme.dart';

class EmptyScreen extends StatelessWidget {
  final String mensagem;
  final double fontSize;

  EmptyScreen({@required this.mensagem, this.fontSize: 24});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        mensagem,
        style: TextStyle(
          fontSize: fontSize,
          color: primaryColor.withOpacity(0.5),
        ),
      ),
    );
  }
}
