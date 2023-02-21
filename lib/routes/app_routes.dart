import 'package:flutter/material.dart';
import 'package:ipotato/routes/route_names.dart';
import 'package:ipotato/ui/screens/home_screen.dart';
import 'package:ipotato/ui/screens/splash_screen.dart';

class AppRoutes {
  ///Add new routes here
  ///Add new route names under route_names.dart
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      ///Splash screen page
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          settings: const RouteSettings(name: RouteNames.splashScreen),
          builder: (_) => const SplashScreen(),
        );

      ///Splash screen page
      case RouteNames.homeScreen:
        return MaterialPageRoute(
          settings: const RouteSettings(name: RouteNames.homeScreen),
          builder: (_) => const HomeScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => SafeArea(
            top: true,
            left: true,
            bottom: true,
            right: true,
            child: Scaffold(
              body:
                  Center(child: Text('No route defined for ${settings.name}')),
            ),
          ),
        );
    }
  }
}
