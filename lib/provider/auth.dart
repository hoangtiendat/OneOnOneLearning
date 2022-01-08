import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  static String token = "";
  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();
  // final prefs = await SharedPreferences.getInstance();
  static Future<void> setToken(String accessToken, String refreshToken) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString("accessToken", accessToken);
    prefs.setString("refreshToken", refreshToken);
    token = accessToken;
  }

  static String getToken() {
    if (token == "") {
      token = _prefs.then((SharedPreferences prefs) {
        return prefs.getString('accessToken') ?? "";
      }) as String;
    }
    return token;
  }
}
