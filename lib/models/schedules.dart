import 'package:json_annotation/json_annotation.dart';

part 'schedules.g.dart';

@JsonSerializable()
class Schedules {
  String? date;
  int? startTimestamp;
  int? endTimestamp;
  String? id;
  String? tutorId;
  String? startTime;
  String? endTime;
  String? createdAt;
  String? updatedAt;
  // List<ScheduleDetailInfo> scheduleDetailInfo;

  Schedules(
    this.date,
    this.startTimestamp,
    this.endTimestamp,
    this.id,
    this.tutorId,
    this.startTime,
    this.endTime,
    this.createdAt,
    this.updatedAt,
  );

  factory Schedules.fromJson(Map<String, dynamic> json) =>
      _$SchedulesFromJson(json);
  Map<String, dynamic> toJson() => _$SchedulesToJson(this);
}
