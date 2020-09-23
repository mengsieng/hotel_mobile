import 'package:flutter/material.dart';
import 'package:skull/src/services/http_services.dart';

class HomeProvider extends ChangeNotifier {
  HttpServices http;
  HomeProvider(this.http);
  int _navIndex = 0;

  set navIndex(int value) {
    _navIndex = value;
    notifyListeners();
  }

  get navIndex => _navIndex;
}
