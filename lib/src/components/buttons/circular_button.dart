import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  CircularButton({
    this.key,
    this.text,
    this.child,
    this.color,
    this.textColor,
    this.onPressed,
  }) : super(key: key);

  final Key key;
  final Function onPressed;
  final Widget child;
  final String text;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Container(
        height: 50,
        width: double.infinity,
        child: RaisedButton(
          child: Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
          color: color,
          textColor: textColor,
          padding: EdgeInsets.all(14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
