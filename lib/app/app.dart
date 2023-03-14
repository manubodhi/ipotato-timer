import 'package:flutter/material.dart';
import 'package:ipotato/constants/color_palette.dart';
import 'package:ipotato/routes/app_routes.dart';
import 'package:ipotato/stores/task_list_store.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ///Added provider for better accessing to the mobx stores, we can add
    ///differnt stores here in the providers list
    return MultiProvider(
      providers: [
        Provider<TaskListStore>(create: (_) => TaskListStore()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',

        ///Custom themes are not defined as of now we are just using a color
        ///swatch based on the accent color provided in the design
        theme: ThemeData(
          primarySwatch: ColorPalette.colorSwatchAccentGreen,
        ),

        ///Routes are defined under AppRoutes, each route and params will be
        ///defined under Approutes and names are saved under route_names.dart file
        onGenerateRoute: AppRoutes.generateRoute,

        ///home is commented because flutter will automatically fetch the route with name "/" defined in route_names
        // home: const SplashScreen(),
      ),
    );
  }
}
