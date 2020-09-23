import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:skull/src/app.dart';

void main() {
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('km', 'KH')],
      path: 'assets/lang',
      fallbackLocale: Locale('en', 'US'),
      child: App(),
    ),
  );
}
