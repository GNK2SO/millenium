import 'package:flutter/material.dart';
import 'package:millenium/src/components/form/imagem/image_form_field.dart';

class ImagemPersonagem extends StatelessWidget {
  final String imagem;
  final Function(dynamic) onChanged;

  ImagemPersonagem({@required this.imagem, @required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ImageFormField(
          context: context,
          imagem: imagem,
          size: 64,
          icon: Icon(Icons.person, size: 80),
          onChanged: onChanged),
    );
  }
}
