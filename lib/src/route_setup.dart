import 'package:flutter/material.dart';
import 'package:skull/src/screens/home/home.dart';
import 'package:skull/src/screens/login/login_screen.dart';
import 'package:skull/src/screens/profile/profile_screen.dart';
import 'package:skull/src/screens/setting/setting_screen.dart';
import 'package:skull/src/screens/signup/sign_up_screen.dart';
import 'package:skull/src/screens/splash_screen.dart';
import 'package:skull/src/screens/welcome/welcome_screen.dart';
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
    case Welcome:
      return MaterialPageRoute(builder: (context) => WelcomeView());
    case SignUp:
      return MaterialPageRoute(builder: (context) => SignUpView());
    case Login:
      return MaterialPageRoute(builder: (context) => LoginView());
    case Profile:
      return MaterialPageRoute(builder: (context) => ProfileView());
    default:
  }
}
