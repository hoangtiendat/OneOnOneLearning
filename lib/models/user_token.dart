import 'package:json_annotation/json_annotation.dart';

import 'package:one_on_one_learning/models/tokens.dart';
import 'package:one_on_one_learning/models/user.dart';

part 'user_token.g.dart';

@JsonSerializable()
class UserToken {
  User? user;
  Tokens? tokens;

  UserToken(this.user, this.tokens);

  factory UserToken.fromJson(Map<String, dynamic> json) =>
      _$UserTokenFromJson(json);
  Map<String, dynamic> toJson() => _$UserTokenToJson(this);
}
