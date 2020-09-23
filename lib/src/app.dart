import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skull/src/provider_setup.dart';
import 'package:skull/src/route_setup.dart';
import 'package:skull/src/utils/app_theme.dart';
import 'package:skull/src/utils/route_name.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Consumer<Dio>(
        builder: (context, dio, _) {
          return MaterialApp(
            theme: themeData,
            onGenerateRoute: generatedRoutes,
            initialRoute: SplashScreen,
          );
        },
      ),
    );
  }
}
