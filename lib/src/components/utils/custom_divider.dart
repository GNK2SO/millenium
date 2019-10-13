import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  CustomDivider(
      {this.margin: 0,
      this.width: 18.0,
      this.height: 2.0,
      this.opacity: 1.0,
      this.color});
  final double margin;
  final double width;
  final double height;
  final double opacity;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: this.margin),
      height: this.height,
      width: this.width,
      color: color ?? Colors.black.withOpacity(opacity),
    );
  }
}
