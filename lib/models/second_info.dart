import 'tutor_info.dart';

import 'package:json_annotation/json_annotation.dart';

part 'second_info.g.dart';

@JsonSerializable()
class SecondInfo {
  String id;
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
  TutorInfo? tutorInfo;

  SecondInfo(
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
      this.tutorInfo);

  factory SecondInfo.fromJson(Map<String, dynamic> json) =>
      _$SecondInfoFromJson(json);
  Map<String, dynamic> toJson() => _$SecondInfoToJson(this);
}
