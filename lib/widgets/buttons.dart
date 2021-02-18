import 'package:flutter/material.dart';
import 'package:haggle_x/theme.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;
  final Color color, borderColor;

  CustomButton({
    @required this.buttonName,
    @required this.onPressed,
    this.color,
    this.borderColor,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              6,
            ),
            side: BorderSide(color: borderColor ?? CustomTheme.orange500),
          ),
          color: color ?? CustomTheme.orange500,
          onPressed: onPressed,
          child: Text(buttonName, style: CustomTheme.headline6)),
    );
  }
}

class CustomGradientButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;
  final Color color1, color2;

  CustomGradientButton({
    @required this.buttonName,
    @required this.onPressed,
    @required this.color1,
    @required this.color2,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: FlatButton(
        onPressed: onPressed,
        textColor: Colors.white,
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(
                6,
              ),
              gradient: new LinearGradient(
                colors: [color1, color2],
              )),
          child: Center(
            child: Text(
              buttonName,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
