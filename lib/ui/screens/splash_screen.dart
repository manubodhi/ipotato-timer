import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ipotato/constants/app_text_styles.dart';
import 'package:ipotato/constants/dimens.dart';
import 'package:ipotato/constants/images.dart';
import 'package:ipotato/routes/route_names.dart';
import 'package:ipotato/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ///after certain timeout the home screen will load
  _startTimeout() async {
    return Timer(const Duration(milliseconds: 1800), () {
      Navigator.pushReplacementNamed(
        context,
        RouteNames.homeScreen,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      left: true,
      bottom: true,
      right: true,
      child: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: Utils.getScreenWidth(context) * 0.5,
              child: Image.asset(Images.logo),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Ipotato Timer",
              style: AppTextStyles.textStyleRegularSplashGreenText,
            )
          ],
        ),
      )),
    );
  }
}
