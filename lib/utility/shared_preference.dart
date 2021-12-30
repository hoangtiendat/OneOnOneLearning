import 'dart:convert';
import 'package:one_on_one_learning/models/user_token.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<void> saveUserToken(UserToken userToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('userToken', jsonEncode(userToken));
    prefs.setString('accessToken', userToken.tokens!.access.token);
  }

  Future<UserToken> getUserToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return UserToken.fromJson(jsonDecode(prefs.getString('userToken') ?? "{}"));
  }

  void removeUserToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('userToken');
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userToken') ?? "";
  }
}
