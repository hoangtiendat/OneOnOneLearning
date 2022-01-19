import 'package:json_annotation/json_annotation.dart';

import 'token.dart';
import 'user.dart';

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
