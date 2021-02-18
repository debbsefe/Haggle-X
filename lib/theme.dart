import 'package:flutter/material.dart';

class CustomTheme {
  CustomTheme._();
  static const Color white = Color(0xFFFFFFFF);
  static const Color purple = Color(0xFF2E1963);
  static const Color orange500 = Color(0xFFFFC175);
  static const Color brown900 = Color(0xFF3E0606);

  static const TextStyle headline3 =
      TextStyle(fontWeight: FontWeight.bold, color: white, fontSize: 40);

  static const TextStyle label = TextStyle(color: white, fontSize: 11);

  static const TextStyle headline6 =
      TextStyle(fontWeight: FontWeight.bold, color: brown900, fontSize: 12);
}
