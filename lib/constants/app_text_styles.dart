import 'package:flutter/material.dart';
import 'package:ipotato/constants/color_palette.dart';

///Textstyles are defined here throughout the application
class AppTextStyles {
  static const TextStyle textStyleRegularImageBodySmallWhiteText = TextStyle(
    color: ColorPalette.colorWhite,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle textStyleRegularHeadingWhite = TextStyle(
    color: ColorPalette.colorWhite,
    fontSize: 32,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle textStyleRegularSplashGreenText = TextStyle(
    color: ColorPalette.colorAccentGreen,
    fontSize: 57,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle textStyleCardTimerGreenText = TextStyle(
    color: ColorPalette.colorTimerTextGreen,
    fontSize: 32,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle textStyleCardTitleGreenText = TextStyle(
    color: ColorPalette.colorAccentGreen,
    fontSize: 22,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle textStyleCardBodyGreenText = TextStyle(
    color: ColorPalette.colorTimerTextGreen,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle textStyleFloatingLabelText = TextStyle(
    color: ColorPalette.colorTimerTextGreen,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle textStylePopupTitleGreyText = TextStyle(
    color: ColorPalette.colorTimerHandGrey,
    fontSize: 40,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle textStyleTimerGreenText = TextStyle(
    color: ColorPalette.colorAccentGreen,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static TextStyle textStyleTimerHandText({Color? color}) => TextStyle(
        color: color ?? ColorPalette.colorTimerHandGrey,
        fontSize: 11,
        fontWeight: FontWeight.w400,
      );
}
