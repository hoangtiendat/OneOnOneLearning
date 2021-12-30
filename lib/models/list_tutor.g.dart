// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_tutor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListTutor _$ListTutorFromJson(Map<String, dynamic> json) => ListTutor(
      json['tutors'] == null
          ? null
          : Tutors.fromJson(json['tutors'] as Map<String, dynamic>),
      (json['favoriteTutor'] as List<dynamic>)
          .map((e) => e == null
              ? null
              : FavoriteTutor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListTutorToJson(ListTutor instance) => <String, dynamic>{
      'tutors': instance.tutors,
      'favoriteTutor': instance.favoriteTutor,
    };
