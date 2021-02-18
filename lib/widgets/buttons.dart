import 'package:flutter/material.dart';
import 'package:haggle_x/theme.dart';
import 'package:sizer/sizer.dart';

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
      height: 8.0.h,
      child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
            side: BorderSide(color: borderColor ?? CustomTheme.orange500),
          ),
          color: color ?? CustomTheme.orange500,
          onPressed: onPressed,
          child: Text(buttonName, style: CustomTheme.headline6)),
    );
  }
}
