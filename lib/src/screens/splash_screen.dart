import 'package:flutter/material.dart';
import 'package:skull/src/utils/route_name.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    initRoute();
    super.initState();
  }

  initRoute() async {
    Future.delayed(
      Duration(seconds: 1),
      () => Navigator.popAndPushNamed(context, Home),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Image.asset(
              'assets/img/building.png',
              width: 80.0,
            ),
          ),
          Center(
            child: Text(
              'Splash Screen',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
