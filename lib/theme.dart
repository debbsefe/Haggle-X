import 'package:flutter/material.dart';

class CustomTheme {
  CustomTheme._();
  static const Color white = Color(0xFFFFFFFF);
  static const Color notwhite = Color(0xFFE8E8E8);
  static const Color purple50 = Color(0xFF6A4BBC);
  static const Color purple = Color(0xFF2E1963);
  static const Color darkpurple = Color(0xFF432B7B);

  static const Color orange500 = Color(0xFFFFC175);
  static const Color brown900 = Color(0xFF3E0606);
  static const Color black = Color(0xFF000000);

  static const TextStyle headline3 =
      TextStyle(fontWeight: FontWeight.bold, color: white, fontSize: 40);
  static const TextStyle headline5 =
      TextStyle(fontWeight: FontWeight.bold, color: black, fontSize: 16);
  static const TextStyle label = TextStyle(color: white, fontSize: 11);
  static const TextStyle labelblack = TextStyle(color: black, fontSize: 11);

  static const TextStyle headline6 =
      TextStyle(fontWeight: FontWeight.bold, color: brown900, fontSize: 12);
  static const TextStyle subtitlelight = TextStyle(color: black, fontSize: 9);
}
