import 'package:one_on_one_learning/models/user.dart';

import 'package:json_annotation/json_annotation.dart';

part 'tutor.g.dart';

@JsonSerializable()
class Tutor {
  String? id;
  String? userId;
  String? video;
  String? bio;
  String? education;
  String? experience;
  String? profession;
  String? accent;
  String? targetStudent;
  String? interests;
  String? languages;
  String? specialties;
  String? resume;
  bool? isActivated;
  bool? isNative;
  String? createdAt;
  String? updatedAt;
  User? user;
  bool? isFavorite;
  double? avgRating;
  int? price;

  Tutor(
      this.id,
      this.userId,
      this.video,
      this.bio,
      this.education,
      this.experience,
      this.profession,
      this.accent,
      this.targetStudent,
      this.interests,
      this.languages,
      this.specialties,
      this.resume,
      this.isActivated,
      this.isNative,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.isFavorite,
      this.avgRating,
      this.price);

  factory Tutor.fromJson(Map<String, dynamic> json) => _$TutorFromJson(json);
  Map<String, dynamic> toJson() => _$TutorToJson(this);

  // List<Course> get courses {
  //   List<TutorCourse> lsTC = TutorCourseModel.lsTutorCourse
  //       .where((element) => element.idTutor == id)
  //       .toList();
  //   return CourseProvider.courseList
  //       .where(
  //         (course) =>
  //             lsTC.where((element) => element.idCourse == course.id).isNotEmpty,
  //       )
  //       .toList();
  // }
}
