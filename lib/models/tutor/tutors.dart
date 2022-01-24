import 'package:json_annotation/json_annotation.dart';
import 'package:one_on_one_learning/models/tutor/rows.dart';

part 'tutors.g.dart';

@JsonSerializable()
class Tutors {
  int count;
  List<Rows> rows;

  Tutors(this.count, this.rows);
  factory Tutors.fromJson(Map<String, dynamic> json) => _$TutorsFromJson(json);
  Map<String, dynamic> toJson() => _$TutorsToJson(this);
}
