import 'dart:convert';
import 'package:one_on_one_learning/models/auth/access.dart';
import 'package:one_on_one_learning/models/auth/token.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<void> saveToken(String email, String password, Tokens token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", email);
    prefs.setString("password", password);
    prefs.setString('accessToken', jsonEncode(token.access));
    prefs.setString('refreshToken', jsonEncode(token.refresh));
  }

  Future<Access> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return Access.fromJson(jsonDecode(prefs.getString('accessToken') ?? "{}"));
  }

  void removeUserToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('userToken');
  }

  // Future<String> getToken() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString('userToken') ?? "";
  // }
}
