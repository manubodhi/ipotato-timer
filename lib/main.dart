import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ipotato/app/app.dart';
import 'package:ipotato/di/injector.dart';

void main() async {
  /// calling this before injection happening
  WidgetsFlutterBinding.ensureInitialized();

  /// Forcing only portrait orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  ///configuring injector to start creating singletons for each repository
  ///classes
  await AppInjector.configure();

  runApp(const App());
}
