import 'package:flutter/material.dart';

class AnimatedButton extends StatelessWidget {
  final AnimationController controller;
  final Function onPressed;
  final Animation<double> squeezeButton;
  final Key key;
  final String text;
  final Color textColor;
  final Color circularIndicatorProgressColor;

  AnimatedButton(
      {@required this.controller,
      this.key,
      this.text,
      this.circularIndicatorProgressColor,
      this.onPressed,
      this.textColor})
      : squeezeButton = Tween(
          begin: 360.0,
          end: 50.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0, 0.15),
          ),
        );

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: buildAnimation,
      animation: this.controller,
    );
  }

  Widget buildAnimation(BuildContext context, Widget child) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Container(
        width: this.squeezeButton.value,
        height: 50,
        child: RaisedButton(
          key: key,
          textColor: textColor,
          disabledColor: Theme.of(context).disabledColor,
          padding: EdgeInsets.all(14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: squeezeButton.value < 105
              ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    this.circularIndicatorProgressColor,
                  ),
                )
              : Text(
                  this.text,
                  style: TextStyle(fontSize: 16),
                ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
