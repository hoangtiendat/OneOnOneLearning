import 'package:flutter/foundation.dart';
import 'package:one_on_one_learning/models/auth/user_token.dart';

// will delete
class UserTokenProvider extends ChangeNotifier {
  UserToken? _userToken;
  void setUserToken(UserToken? userToken) {
    _userToken = userToken;
    // notifyListeners();
  }

  UserToken? getUserToken() => _userToken;
}
