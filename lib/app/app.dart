import 'package:flutter/material.dart';
import 'package:ipotato/constants/color_palette.dart';
import 'package:ipotato/routes/app_routes.dart';
import 'package:ipotato/stores/task_list_store.dart';
import 'package:ipotato/stores/task_store.dart';
import 'package:ipotato/ui/screens/splash_screen.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<TaskListStore>(create: (_) => TaskListStore()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: ColorPalette.colorSwatchAccentGreen,
        ),

        ///Routes are defined under AppRoutes
        onGenerateRoute: AppRoutes.generateRoute,

        ///home is commented because flutter will automatically fetch the route with name "/" defined in route_names
        // home: const SplashScreen(),
      ),
    );
  }
}
