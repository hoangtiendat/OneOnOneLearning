import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:one_on_one_learning/models/auth/access.dart';
import 'package:one_on_one_learning/models/auth/user.dart';
import 'package:one_on_one_learning/models/auth/users.dart';

import 'package:one_on_one_learning/utility/shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<User> fetchUserV2() async {
    if (_user != null) {
      return _user!;
    }
    var url = Uri.parse('$urlApi/user/info');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token =
        Access.fromJson(jsonDecode(prefs.getString('accessToken') ?? "{}"))
                .token ??
            "";
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var response = await http.get(
      url,
      headers: headers,
      // body: jsonEncode({}),
    );
    if (response.statusCode == 200) {
      User newUser = User.fromJson(jsonDecode(response.body)["user"]);
      _user = newUser;
      notifyListeners();
      return newUser;
    } else {
      throw Exception('Failed to load user');
    }
  }

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
      var userToken = Users.fromJson(jsonDecode(response.body));
      UserPreferences().saveToken(email, password, userToken.tokens!);
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

  Future<Map<String, dynamic>> forgotPassWord(String email) async {
    _registeredInStatus = Status.registering;
    notifyListeners();
    Map<String, dynamic> result;
    var url = Uri.parse('$urlApi/user/forgotPassword');
    var headers = {
      'Content-Type': 'application/json',
    };
    var response = await http.post(
      url,
      headers: headers,
      body: jsonEncode({'email': email}),
    );
    if (response.statusCode == 200) {
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

  Future<void> updateUser(final parameters) async {
    var url = Uri.parse('$urlApi/user/info');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token =
        Access.fromJson(jsonDecode(prefs.getString('accessToken') ?? "{}"))
                .token ??
            "";
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await http.put(
      url,
      headers: headers,
      body: jsonEncode(parameters),
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      _user = User.fromJson(json["user"]);
      notifyListeners();
    } else {
      throw Exception('Failed to load course');
    }
  }

  Future<void> fetchUser(String token) async {
    var url = Uri.parse('$urlApi/user/info');

    // Access token = await UserPreferences().getToken();

    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // String token =
    //     Access.fromJson(jsonDecode(prefs.getString('accessToken') ?? "{}"))
    //             .token ??
    //         "";
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await http.get(
      url,
      headers: headers,
      // body: jsonEncode({}),
    );
    if (response.statusCode == 200) {
      User newUser = User.fromJson(jsonDecode(response.body)["user"]);
      _user = newUser;
      notifyListeners();
    } else {
      // if (response.statusCode == 500) {
      //   if (jsonDecode(response.body)["statusCode"] == 1) {
      //     fetchUser(token);
      //   }
      // }
      throw Exception('Failed to load user');
    }
  }

  static onError(error) {
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }
}
