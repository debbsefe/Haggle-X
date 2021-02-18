import 'package:flutter/material.dart';
import '../theme.dart';

const inputDecoration = InputDecoration(
  hintStyle: CustomTheme.label,
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: CustomTheme.white),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: CustomTheme.white),
  ),
);

const blackinputDecoration = InputDecoration(
  hintStyle: CustomTheme.labelblack,
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: CustomTheme.black),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: CustomTheme.black),
  ),
);
