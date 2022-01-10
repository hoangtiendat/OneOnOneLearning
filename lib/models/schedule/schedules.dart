import 'package:one_on_one_learning/models/schedule/schedule.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schedules.g.dart';

@JsonSerializable()
class Schedules {
  int? count;
  List<Schedule>? rows;
  Schedules(this.count, this.rows);
  factory Schedules.fromJson(Map<String, dynamic> json) =>
      _$SchedulesFromJson(json);
  Map<String, dynamic> toJson() => _$SchedulesToJson(this);
}
