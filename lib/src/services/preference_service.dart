import 'package:shared_preferences/shared_preferences.dart';

class SharePreferenceService {
  static const String _token = "token_key";
  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_token, token);
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_token);
  }
}

SharePreferenceService sharePreferenceService = SharePreferenceService();
