import 'package:flutter/material.dart';

class Height extends StatelessWidget {
  final double height;

  const Height(this.height);
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

class Width extends StatelessWidget {
  final double width;

  const Width(this.width);
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}
