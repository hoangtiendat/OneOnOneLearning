import 'first_info.dart';

import 'package:json_annotation/json_annotation.dart';

part 'feedback.g.dart';

@JsonSerializable()
class Feedbacks {
  String id;
  String? bookingId;
  String? firstId;
  String? secondId;
  int? rating;
  String? content;
  String? createdAt;
  String? updatedAt;
  FirstInfo? firstInfo;

  Feedbacks(this.id, this.bookingId, this.firstId, this.secondId, this.rating,
      this.content, this.createdAt, this.updatedAt, this.firstInfo);

  factory Feedbacks.fromJson(Map<String, dynamic> json) =>
      _$FeedbacksFromJson(json);
  Map<String, dynamic> toJson() => _$FeedbacksToJson(this);
}
