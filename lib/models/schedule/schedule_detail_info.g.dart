// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_detail_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleDetailInfo _$ScheduleDetailInfoFromJson(Map<String, dynamic> json) =>
    ScheduleDetailInfo(
      json['startPeriodTimestamp'] as int?,
      json['endPeriodTimestamp'] as int?,
      json['id'] as String?,
      json['scheduleId'] as String?,
      json['startPeriod'] as String?,
      json['endPeriod'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['scheduleInfo'] == null
          ? null
          : ScheduleInfo.fromJson(json['scheduleInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ScheduleDetailInfoToJson(ScheduleDetailInfo instance) =>
    <String, dynamic>{
      'startPeriodTimestamp': instance.startPeriodTimestamp,
      'endPeriodTimestamp': instance.endPeriodTimestamp,
      'id': instance.id,
      'scheduleId': instance.scheduleId,
      'startPeriod': instance.startPeriod,
      'endPeriod': instance.endPeriod,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'scheduleInfo': instance.scheduleInfo,
    };
