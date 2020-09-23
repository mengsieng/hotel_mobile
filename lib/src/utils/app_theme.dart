import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  primaryColor: Color(0XFF69C6BB),
  scaffoldBackgroundColor: Color(0XFFF3F3F3),
  cursorColor: Colors.white,
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    textTheme: TextTheme(
      // ignore: deprecated_member_use
      title: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
  ),
);
