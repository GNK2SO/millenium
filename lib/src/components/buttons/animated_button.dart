import 'package:flutter/material.dart';

class AnimatedButton extends StatelessWidget {
  
  final Key key;
  final String text;
  final Color textColor;
  final Color primaryColor;
  final Color circularIndicatorProgressColor;
  final AnimationController controller;
  final Function onPressed;

  final Animation<double> squeezeButton;

  AnimatedButton({
    this.key,
    this.text,
    this.textColor,
    this.primaryColor,
    this.circularIndicatorProgressColor,
    @required this.controller,
    this.onPressed,
  }) : squeezeButton = Tween(
          begin: 360.0,
          end: 50.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0, 0.15),
          ),
        ) , super(key: key);

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
        width: squeezeButton.value,
        height: 50,
        child: RaisedButton(
          textColor: textColor,
          color: primaryColor,
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
