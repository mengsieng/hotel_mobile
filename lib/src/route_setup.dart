import 'package:flutter/material.dart';
import 'package:skull/src/screens/home.dart';
import 'package:skull/src/screens/setting/setting_screen.dart';
import 'package:skull/src/screens/splash_screen.dart';
import 'package:skull/src/utils/route_name.dart';

// ignore: missing_return
Route generatedRoutes(RouteSettings settings) {
  switch (settings.name) {
    case Home:
      return MaterialPageRoute(builder: (context) => HomeView());
    case SplashScreen:
      return MaterialPageRoute(builder: (context) => SplashView());
    case Setting:
      return MaterialPageRoute(builder: (context) => SettingView());
    default:
  }
}
