// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_tutor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteTutor _$FavoriteTutorFromJson(Map<String, dynamic> json) =>
    FavoriteTutor(
      json['id'] as String,
      json['firstId'] as String?,
      json['secondId'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['secondInfo'] == null
          ? null
          : SecondInfo.fromJson(json['secondInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FavoriteTutorToJson(FavoriteTutor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstId': instance.firstId,
      'secondId': instance.secondId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'secondInfo': instance.secondInfo,
    };
