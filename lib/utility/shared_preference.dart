import 'dart:convert';
import 'package:one_on_one_learning/models/access.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<void> saveToken(
      String email, String password, Access accessToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", email);
    prefs.setString("password", password);
    prefs.setString('accessToken', jsonEncode(accessToken));
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
