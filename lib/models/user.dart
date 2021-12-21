import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String id;
  String email;
  String name;
  String avatar;
  String country;
  String phone;
  List<String> roles;

  User(this.id, this.email, this.name, this.avatar, this.country, this.phone,
      this.roles);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
