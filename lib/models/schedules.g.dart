// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedules.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Schedules _$SchedulesFromJson(Map<String, dynamic> json) => Schedules(
      json['date'] as String?,
      json['startTimestamp'] as int?,
      json['endTimestamp'] as int?,
      json['id'] as String?,
      json['tutorId'] as String?,
      json['startTime'] as String?,
      json['endTime'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
    );

Map<String, dynamic> _$SchedulesToJson(Schedules instance) => <String, dynamic>{
      'date': instance.date,
      'startTimestamp': instance.startTimestamp,
      'endTimestamp': instance.endTimestamp,
      'id': instance.id,
      'tutorId': instance.tutorId,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
