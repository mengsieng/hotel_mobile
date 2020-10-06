import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:skull/src/model/user_model.dart';

class SharePreferenceService {
  static const String _token = "token_key";
  static const String _user = "user_key";
  static const String _language = "language_chooser";
  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_token, token);
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_token);
  }

  Future<void> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_token);
    await prefs.remove(_user);
  }

  Future<void> setUser(Data data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_user, json.encode(data.toJson()));
  }

  Future<Data> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final map = prefs.get(_user);
    return map != null ? Data.fromJson(jsonDecode(map)) : null;
  }

  Future<void> setLanguage(bool language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_language, language);
  }

  Future<bool> getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_language);
  }
}

SharePreferenceService sharePreferenceService = SharePreferenceService();
