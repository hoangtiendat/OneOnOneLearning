// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedules.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Schedules _$SchedulesFromJson(Map<String, dynamic> json) => Schedules(
      json['count'] as int?,
      (json['rows'] as List<dynamic>?)
          ?.map((e) => Schedule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SchedulesToJson(Schedules instance) => <String, dynamic>{
      'count': instance.count,
      'rows': instance.rows,
    };
