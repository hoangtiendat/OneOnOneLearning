import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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

  // Status get loggedInStatus => _loggedInStatus;

  // get url_api => null;

  // set loggedInStatus(Status value) {
  //   _loggedInStatus = value;
  // }

  // Status get registeredInStatus => _registeredInStatus;

  // set registeredInStatus(Status value) {
  //   _registeredInStatus = value;
  // }

  // Future<Map<String, dynamic>> register(String email, String password) async {
  //   final Map<String, dynamic> apiBodyData = {
  //     'email': email,
  //     'password': password
  //   };

  //   return await post(
  //     AppUrl.register,
  //     body: json.encode(apiBodyData),
  //     headers: {'Content-Type':'application/json'}
  //   ).then(onValue)
  //   .catchError(onError);
  // }

  notify() {
    notifyListeners();
  }

  // static Future<FutureOr> onValue(http.Response response) async {
  //   var result;

  //   final Map<String, dynamic> responseData = json.decode(response.body);

  //   print(responseData);

  //   if (response.statusCode == 200) {
  //     var userData = responseData['data'];

  //     // now we will create a user model
  //     User authUser = User.fromJson(responseData);

  //     // now we will create shared preferences and save data
  //     UserPreferences().saveUser(authUser);

  //     result = {
  //       'status': true,
  //       'message': 'Successfully registered',
  //       'data': authUser
  //     };
  //   } else {
  //     result = {
  //       'status': false,
  //       'message': 'Successfully registered',
  //       'data': responseData
  //     };
  //   }
  //   return result;
  // }

  Future<Map<String, dynamic>> login(String email, String password) async {
    Map<String, dynamic> result;
    _loggedInStatus = Status.authenticating;
    notifyListeners();
    var url = Uri.parse('$urlApi/auth/login');
    var response =
        await http.post(url, body: {'email': email, 'password': password});
    if (response.statusCode == 200) {
      var userToken = UserToken.fromJson(jsonDecode(response.body));
      UserPreferences().saveUserToken(userToken);

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
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  static onError(error) {
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }
}
