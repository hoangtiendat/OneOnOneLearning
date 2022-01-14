// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Schedule _$ScheduleFromJson(Map<String, dynamic> json) => Schedule(
      json['createdAtTimeStamp'] as int?,
      json['updatedAtTimeStamp'] as int?,
      json['id'] as String?,
      json['userId'] as String?,
      json['scheduleDetailId'] as String?,
      json['tutorMeetingLink'] as String?,
      json['studentMeetingLink'] as String?,
      json['studentRequest'] as String?,
      json['tutorReview'] as String?,
      json['scoreByTutor'] as int?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['recordUrl'] as String?,
      json['isDeleted'] as bool?,
      json['scheduleDetailInfo'] == null
          ? null
          : ScheduleDetailInfo.fromJson(
              json['scheduleDetailInfo'] as Map<String, dynamic>),
      json['showRecordUrl'] as bool?,
      (json['studentMaterials'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ScheduleToJson(Schedule instance) => <String, dynamic>{
      'createdAtTimeStamp': instance.createdAtTimeStamp,
      'updatedAtTimeStamp': instance.updatedAtTimeStamp,
      'id': instance.id,
      'userId': instance.userId,
      'scheduleDetailId': instance.scheduleDetailId,
      'tutorMeetingLink': instance.tutorMeetingLink,
      'studentMeetingLink': instance.studentMeetingLink,
      'studentRequest': instance.studentRequest,
      'tutorReview': instance.tutorReview,
      'scoreByTutor': instance.scoreByTutor,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'recordUrl': instance.recordUrl,
      'isDeleted': instance.isDeleted,
      'scheduleDetailInfo': instance.scheduleDetailInfo,
      'showRecordUrl': instance.showRecordUrl,
      'studentMaterials': instance.studentMaterials,
    };
