import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ipotato/constants/app_text_styles.dart';
import 'package:ipotato/constants/color_palette.dart';
import 'package:ipotato/constants/dimens.dart';
import 'package:ipotato/constants/strings.dart';

///Common utilities are getting added here
///Helpful functions like making snackbars fetching screen width and heights etc.
class Utils {
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static String getHandsFromDurationString({required String durationString}) {
    final hour = durationString.toString().split(":")[0];
    final minute = durationString.toString().split(":")[1];
    final second = durationString.toString().split(":")[2].split(".").first;
    return "$hour:$minute:$second";
  }

  static Duration getDurationFromString({required String durationString}) {
    final hour = durationString.split(":")[0];
    final minute = durationString.split(":")[1];
    final second = durationString.split(":")[2].split(".").first;
    return Duration(
      hours: int.parse(hour),
      minutes: int.parse(minute),
      seconds: int.parse(second),
    );
  }

  static showSnackBar(
      {required BuildContext context, required String message}) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  static showSimpleDialogBox({
    required BuildContext context,
    required String title,
    required Widget body,
    Function()? methodCall,
  }) {
    SimpleDialog dialog = SimpleDialog(
      backgroundColor: ColorPalette.colorCardBlue,
      contentPadding: const EdgeInsets.all(0),
      title: Text(
        title,
        style: AppTextStyles.textStylePopupTitleGreyText,
      ),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.cardCornerRadius),
      ),
      children: <Widget>[
        body,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }
}
