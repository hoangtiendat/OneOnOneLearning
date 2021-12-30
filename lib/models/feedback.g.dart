// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feedbacks _$FeedbacksFromJson(Map<String, dynamic> json) => Feedbacks(
      json['id'] as String,
      json['bookingId'] as String?,
      json['firstId'] as String?,
      json['secondId'] as String?,
      json['rating'] as int?,
      json['content'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['firstInfo'] == null
          ? null
          : FirstInfo.fromJson(json['firstInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeedbacksToJson(Feedbacks instance) => <String, dynamic>{
      'id': instance.id,
      'bookingId': instance.bookingId,
      'firstId': instance.firstId,
      'secondId': instance.secondId,
      'rating': instance.rating,
      'content': instance.content,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'firstInfo': instance.firstInfo,
    };
