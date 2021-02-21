import 'package:flutter/material.dart';

class CustomTheme {
  CustomTheme._();
  static const Color white = Color(0xFFFFFFFF);
  static const Color notwhite = Color(0xFFE8E8E8);
  static const Color purple50 = Color(0xFF6A4BBC);
  static const Color purple = Color(0xFF2E1963);
  static const Color darkpurple = Color(0xFF432B7B);
  static const Color red = Color(0xFFF52626);

  static const Color orange500 = Color(0xFFFFC175);
  static const Color brown900 = Color(0xFF3E0606);
  static const Color black = Color(0xFF000000);
  static const Color lightgreen = Color(0xFF52CB35);

  static const TextStyle headline3 =
      TextStyle(fontWeight: FontWeight.bold, color: white, fontSize: 40);
  static const TextStyle headline4 =
      TextStyle(fontWeight: FontWeight.bold, color: white, fontSize: 18);
  static const TextStyle headline5 =
      TextStyle(fontWeight: FontWeight.bold, color: black, fontSize: 16);
  static const TextStyle label = TextStyle(color: white, fontSize: 11);
  static const TextStyle labelblack = TextStyle(color: black, fontSize: 11);

  static const TextStyle headline6 =
      TextStyle(fontWeight: FontWeight.bold, color: brown900, fontSize: 12);
  static const TextStyle subtitlelight = TextStyle(color: black, fontSize: 9);
  static const TextStyle subtitlewhite = TextStyle(color: white, fontSize: 9);

  static const TextStyle bodyText = TextStyle(
    color: white,
    fontSize: 25,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle bodyText2 = TextStyle(
    color: black,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle title = TextStyle(
    color: black,
    fontSize: 13,
  );
}
