// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'second_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SecondInfo _$SecondInfoFromJson(Map<String, dynamic> json) => SecondInfo(
      json['id'] as String,
      json['level'] as String?,
      json['email'] as String?,
      json['google'] as String?,
      json['facebook'] as String?,
      json['apple'] as String?,
      json['avatar'] as String?,
      json['name'] as String?,
      json['country'] as String?,
      json['phone'] as String?,
      json['language'] as String?,
      json['birthday'] as String?,
      json['requestPassword'] as bool?,
      json['isActivated'] as bool?,
      json['isPhoneActivated'] as bool?,
      json['requireNote'] as String?,
      json['timezone'] as int?,
      json['phoneAuth'] as String?,
      json['isPhoneAuthActivated'] as bool?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['deletedAt'] as String?,
      json['tutorInfo'] == null
          ? null
          : TutorInfo.fromJson(json['tutorInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SecondInfoToJson(SecondInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'level': instance.level,
      'email': instance.email,
      'google': instance.google,
      'facebook': instance.facebook,
      'apple': instance.apple,
      'avatar': instance.avatar,
      'name': instance.name,
      'country': instance.country,
      'phone': instance.phone,
      'language': instance.language,
      'birthday': instance.birthday,
      'requestPassword': instance.requestPassword,
      'isActivated': instance.isActivated,
      'isPhoneActivated': instance.isPhoneActivated,
      'requireNote': instance.requireNote,
      'timezone': instance.timezone,
      'phoneAuth': instance.phoneAuth,
      'isPhoneAuthActivated': instance.isPhoneAuthActivated,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'tutorInfo': instance.tutorInfo,
    };
