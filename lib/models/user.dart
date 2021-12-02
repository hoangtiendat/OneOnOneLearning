import 'courses.dart';
import 'feedback.dart';

class User {
  String? id;
  String? level;
  String? email;
  String? google;
  String? facebook;
  String? apple;
  String? avatar;
  String? name;
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
  bool? isPhoneAuthActivated;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  List<Feedbacks>? feedbacks;
  List<Course>? courses;

  User(
      {required this.id,
      required this.level,
      required this.email,
      required this.google,
      required this.facebook,
      required this.apple,
      required this.avatar,
      required this.name,
      required this.country,
      required this.phone,
      required this.language,
      required this.birthday,
      required this.requestPassword,
      required this.isActivated,
      required this.isPhoneActivated,
      required this.requireNote,
      required this.timezone,
      required this.phoneAuth,
      required this.isPhoneAuthActivated,
      required this.createdAt,
      required this.updatedAt,
      required this.deletedAt,
      required this.feedbacks,
      required this.courses});
}
