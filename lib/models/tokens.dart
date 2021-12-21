import 'package:json_annotation/json_annotation.dart';

import 'access.dart';

part 'tokens.g.dart';

@JsonSerializable()
class Tokens {
  Access access;
  Access refresh;

  Tokens(this.access, this.refresh);

  factory Tokens.fromJson(Map<String, dynamic> json) => _$TokensFromJson(json);
  Map<String, dynamic> toJson() => _$TokensToJson(this);
}
