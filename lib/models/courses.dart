import 'package:flutter/foundation.dart';

class CourseProvider extends ChangeNotifier {
  Course? courseCurr;
  void setCourseCurr(Course? course) {
    courseCurr = course;
  }

  List<Course> courseList = [
    Course(
      "1",
      "Basic Conversation Topics (New)",
      "assets/images/avatar/avatar3.jpg",
      "Beginner",
      "1",
    ),
    Course(
      "2",
      "Intermediate Conversation Topics (New)",
      "assets/images/avatar/avatar2.jpg",
      "Intermediate",
      "3",
    ),
    Course(
      "3",
      "Healthy Mind, Healthy Body (New)",
      "assets/images/avatar/avatar1.jpg",
      "Advanced",
      "3",
    ),
    Course(
      "4",
      "Movies and Television (New)",
      "assets/images/avatar/avatar4.jpg",
      "Intermediate",
      "2",
    ),
  ];

  List<Course> _availableTutors = [];

  Future<void> getCourses() async {
    _availableTutors = courseList;
  }

  List<Course> search(
      String searchTerms, String idCategory, String selectedLevel) {
    return _availableTutors.where((course) {
      return course.name.toLowerCase().contains(searchTerms.toLowerCase()) &&
          (course.category == idCategory || idCategory == "0") &&
          (course.level == selectedLevel || selectedLevel == "Any Level");
    }).toList();
  }
}

class Course {
  String id;
  String name;
  // String description;
  String imageUrl;
  String level;
  String category;
  // String? reason;
  // String? purpose;
  // String? otherDetails;
  // int? defaultPrice;
  // int? coursePrice;
  // String? courseType;
  // String? sectionType;
  // bool? visible;
  // String? createdAt;
  // String? updatedAt;

  Course(
    this.id,
    this.name,
    // this.description,
    this.imageUrl,
    this.level,
    this.category,
    // this.reason,
    // this.purpose,
    // this.otherDetails,
    // this.defaultPrice,
    // this.coursePrice,
    // this.courseType,
    // this.sectionType,
    // this.visible,
    // this.createdAt,
    // this.updatedAt,
  );
}
