import 'dart:convert';

import 'package:flutter/material.dart';

class ImagemPerfil extends StatelessWidget {
  final dynamic imagem;
  final Icon icon;
  final Color backgroundColor;
  final double radius;
  ImagemPerfil(
      {@required this.imagem, this.radius, this.icon, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    if (this.imagem == null) {
      return CircleAvatar(
        radius: this.radius,
        child: this.icon,
        backgroundColor: this.backgroundColor,
      );
    } else if (this.imagem is String) {
      return CircleAvatar(
        radius: this.radius,
        backgroundColor: Theme.of(context).primaryColor,
        backgroundImage: MemoryImage(base64Decode(this.imagem)),
      );
    } else {
      return Container();
    }
  }
}
