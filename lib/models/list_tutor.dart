import 'favorite_tutor.dart';
import 'tutors.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_tutor.g.dart';

@JsonSerializable()
class ListTutor {
  Tutors? tutors;
  List<FavoriteTutor?> favoriteTutor;

  ListTutor(this.tutors, this.favoriteTutor);
  factory ListTutor.fromJson(Map<String, dynamic> json) =>
      _$ListTutorFromJson(json);
  Map<String, dynamic> toJson() => _$ListTutorToJson(this);
}
