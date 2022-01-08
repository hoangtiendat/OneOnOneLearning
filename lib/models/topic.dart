import 'package:json_annotation/json_annotation.dart';
part 'topic.g.dart';

@JsonSerializable()
class Topics {
  String? id;
  String? courseId;
  int? orderCourse;
  String? name;
  String? nameFile;
  String? description;
  String? videoUrl;
  String? createdAt;
  String? updatedAt;

  Topics(
      {this.id,
      this.courseId,
      this.orderCourse,
      this.name,
      this.nameFile,
      this.description,
      this.videoUrl,
      this.createdAt,
      this.updatedAt});

  factory Topics.fromJson(Map<String, dynamic> json) => _$TopicsFromJson(json);
  Map<String, dynamic> toJson() => _$TopicsToJson(this);
}
