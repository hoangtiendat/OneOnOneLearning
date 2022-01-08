import 'package:json_annotation/json_annotation.dart';
import 'package:one_on_one_learning/models/courses.dart';

import 'feedback.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String? id;
  String? level;
  String? email;
  String? google;
  String? facebook;
  String? apple;
  String? avatar;
  String? name;
  String? country;
  String? phone;
  String? language;
  String? birthday;
  bool? requestPassword;
  bool? isActivated;
  bool? isPhoneActivated;
  String? requireNote;
  int? timezone;
  String? phoneAuth;
  bool? isPhoneAuthActivated;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  List<Feedbacks>? feedbacks;
  List<Course>? courses;

  User(
      this.id,
      this.level,
      this.email,
      this.google,
      this.facebook,
      this.apple,
      this.avatar,
      this.name,
      this.country,
      this.phone,
      this.language,
      this.birthday,
      this.requestPassword,
      this.isActivated,
      this.isPhoneActivated,
      this.requireNote,
      this.timezone,
      this.phoneAuth,
      this.isPhoneAuthActivated,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.feedbacks,
      this.courses);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
