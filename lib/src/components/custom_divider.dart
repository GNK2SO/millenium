import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  CustomDivider(
      {this.width: 18.0, this.height: 2.0, this.opacity: 1.0, this.color});

  final double width;
  final double height;
  final double opacity;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      color: color ?? Colors.black.withOpacity(opacity),
    );
  }
}
