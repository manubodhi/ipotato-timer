import 'package:flutter/material.dart';

///Colors are getting referred from here add new colors here add 0xFF for normal color codes
class ColorPalette {
  static const colorWhite = Color(0xFFFFFFFF);
  static const colorBlack = Color(0xFF000000);
  static const colorFabSkyBlue = Color(0xFFB6EAFF);
  static const colorAccentGreen = Color(0xFF216C2E);
  static const colorCardBlue = Color(0xFFFBFCFE);
  static const colorMarkCompleteButtonPurple = Color(0xFFE1DFFF);
  static const colorPlayButtonGrey = Color(0xFF5B5B7D);
  static const colorInactiveGrey = Color(0xFF70787D);
  static const colorTimerTextGreen = Color(0xFF006782);
  static const colorTimerBoxGreen = Color(0xFFA7F5A7);
  static const colorTimerHandGrey = Color(0xFF40484C);

  static const MaterialColor colorSwatchAccentGreen = MaterialColor(
    0xFF216C2E,
    {
      50: Color.fromRGBO(33, 108, 46, .1),
      100: Color.fromRGBO(33, 108, 46, .2),
      200: Color.fromRGBO(33, 108, 46, .3),
      300: Color.fromRGBO(33, 108, 46, .4),
      400: Color.fromRGBO(33, 108, 46, .5),
      500: Color.fromRGBO(33, 108, 46, .6),
      600: Color.fromRGBO(33, 108, 46, .7),
      700: Color.fromRGBO(33, 108, 46, .8),
      800: Color.fromRGBO(33, 108, 46, .9),
      900: Color.fromRGBO(33, 108, 46, 1),
    },
  );
}
