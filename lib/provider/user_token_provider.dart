import 'package:flutter/foundation.dart';
import 'package:one_on_one_learning/models/user_token.dart';

class UserTokenProvider extends ChangeNotifier {
  UserToken? _userToken;
  void setUserToken(UserToken? userToken) {
    _userToken = userToken;
    // notifyListeners();
  }

  UserToken? getUserToken() => _userToken;
}
