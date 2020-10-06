import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  primaryColor: Color(0XFF69C6BB),
  scaffoldBackgroundColor: Color(0XFFF3F3F3),
  focusColor: Color(0XFF69C6BB),
  accentColor: Color(0XFF69C6BB),
  cursorColor: Colors.white,
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    elevation: 0.0,
    color: Colors.transparent,
    textTheme: TextTheme(
      // ignore: deprecated_member_use
      title: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
);
