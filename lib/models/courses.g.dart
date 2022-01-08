// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      json['id'] as String?,
      json['name'] as String?,
      json['description'] as String?,
      json['imageUrl'] as String?,
      json['level'] as String?,
      json['reason'] as String?,
      json['purpose'] as String?,
      json['otherDetails'] as String?,
      json['defaultPrice'] as int?,
      json['coursePrice'] as int?,
      json['courseType'] as String?,
      json['sectionType'] as String?,
      json['visible'] as bool?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      (json['topics'] as List<dynamic>?)
          ?.map((e) => Topics.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['users'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'level': instance.level,
      'reason': instance.reason,
      'purpose': instance.purpose,
      'otherDetails': instance.otherDetails,
      'defaultPrice': instance.defaultPrice,
      'coursePrice': instance.coursePrice,
      'courseType': instance.courseType,
      'sectionType': instance.sectionType,
      'visible': instance.visible,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'topics': instance.topics,
      'users': instance.users,
    };
