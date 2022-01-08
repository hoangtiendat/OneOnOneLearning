import 'package:flutter/foundation.dart';
import 'package:one_on_one_learning/models/category.dart';
import 'package:one_on_one_learning/models/courses.dart';
import 'package:one_on_one_learning/models/schedules.dart';
import 'package:one_on_one_learning/models/tutor_course.dart';

import 'feedback.dart';

import 'package:json_annotation/json_annotation.dart';

part 'tutor.g.dart';

@JsonSerializable()
class Tutor {
  String? level;
  String? email;
  String? google;
  String? facebook;
  String? apple;
  String avatar;
  String name;
  String? country;
  String? phone;
  String? language;
  String? birthday;
  bool? requestPassword;
  bool? isActivated;
  bool? isPhoneActivated;
  String? requireNote;
  int? timezone;
  String? phoneAuth;
  bool isPhoneAuthActivated;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  List<Feedbacks?>? feedbacks;
  List<Schedules?>? schedules;
  String id;
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
  bool? isNative;
  int? price;
  bool isFavorite = false;

  Tutor(
      this.level,
      this.email,
      this.google,
      this.facebook,
      this.apple,
      this.avatar,
      this.name,
      this.country,
      this.phone,
      this.language,
      this.birthday,
      this.requestPassword,
      this.isActivated,
      this.isPhoneActivated,
      this.requireNote,
      this.timezone,
      this.phoneAuth,
      this.isPhoneAuthActivated,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.feedbacks,
      this.schedules,
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
      this.isNative,
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
