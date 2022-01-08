import 'package:json_annotation/json_annotation.dart';
import 'package:one_on_one_learning/models/topic.dart';
import 'package:one_on_one_learning/models/user.dart';
part 'courses.g.dart';

@JsonSerializable()
class Course {
  String? id;
  String? name;
  String? description;
  String? imageUrl;
  String? level;
  String? reason;
  String? purpose;
  String? otherDetails;
  int? defaultPrice;
  int? coursePrice;
  String? courseType;
  String? sectionType;
  bool? visible;
  String? createdAt;
  String? updatedAt;
  List<Topics>? topics;
  List<User>? users;

  Course(
      this.id,
      this.name,
      this.description,
      this.imageUrl,
      this.level,
      this.reason,
      this.purpose,
      this.otherDetails,
      this.defaultPrice,
      this.coursePrice,
      this.courseType,
      this.sectionType,
      this.visible,
      this.createdAt,
      this.updatedAt,
      this.topics,
      this.users);

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
  Map<String, dynamic> toJson() => _$CourseToJson(this);
}
