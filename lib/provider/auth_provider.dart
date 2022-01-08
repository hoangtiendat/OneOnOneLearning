import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:one_on_one_learning/models/user.dart';
import 'package:one_on_one_learning/models/user_token.dart';
import 'package:one_on_one_learning/utility/shared_preference.dart';

import '../constants.dart';

enum Status {
  notLoggedIn,
  notRegistered,
  loggedIn,
  registered,
  authenticating,
  registering,
  loggedOut
}

class AuthProvider extends ChangeNotifier {
  Status _loggedInStatus = Status.notLoggedIn;
  Status _registeredInStatus = Status.notRegistered;

  User? _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  get user => _user;

  void setLoggedInStatus(Status loggedInStatus) {
    _loggedInStatus = loggedInStatus;
    notifyListeners();
  }

  get loggedInStatus => _loggedInStatus;

  void setRegisteredInStatus(Status registeredInStatus) {
    _registeredInStatus = registeredInStatus;
    notifyListeners();
  }

  get registeredInStatus => _registeredInStatus;

  Future<Map<String, dynamic>> login(String email, String password) async {
    Map<String, dynamic> result;
    _loggedInStatus = Status.authenticating;
    notifyListeners();
    var url = Uri.parse('$urlApi/auth/login');
    var response =
        await http.post(url, body: {'email': email, 'password': password});
    if (response.statusCode == 200) {
      var userToken = UserToken.fromJson(jsonDecode(response.body));
      UserPreferences().saveToken(userToken.tokens!.access);
      _user = userToken.user;
      _loggedInStatus = Status.loggedIn;
      notifyListeners();

      result = {
        'status': true,
        'message': 'Successful',
        'userToken': userToken
      };
    } else {
      _loggedInStatus = Status.notLoggedIn;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['message']
      };
    }
    return result;
  }

  Future<Map<String, dynamic>> register(String email, String password) async {
    _registeredInStatus = Status.registering;
    notifyListeners();
    Map<String, dynamic> result;
    var url = Uri.parse('$urlApi/auth/register');
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {'email': email, 'password': password},
    );
    if (response.statusCode == 201) {
      result = {'status': true, 'message': 'Successful'};
    } else {
      result = {
        'status': false,
        'message': jsonDecode(response.body)['message']
      };
    }
    _registeredInStatus = Status.registered;
    notifyListeners();
    return result;
  }

  static onError(error) {
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }
}
