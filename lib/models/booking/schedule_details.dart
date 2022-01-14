import 'booking_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schedule_details.g.dart';

@JsonSerializable()
class ScheduleDetails {
  int? startPeriodTimestamp;
  int? endPeriodTimestamp;
  String? id;
  String? scheduleId;
  String? startPeriod;
  String? endPeriod;
  String? createdAt;
  String? updatedAt;
  List<BookingInfo>? bookingInfo;
  bool? isBooked;

  ScheduleDetails(
      {this.startPeriodTimestamp,
      this.endPeriodTimestamp,
      this.id,
      this.scheduleId,
      this.startPeriod,
      this.endPeriod,
      this.createdAt,
      this.updatedAt,
      this.bookingInfo,
      this.isBooked});
  factory ScheduleDetails.fromJson(Map<String, dynamic> json) =>
      _$ScheduleDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleDetailsToJson(this);
}
