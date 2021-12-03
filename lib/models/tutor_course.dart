class TutorCourseModel {
  static List<TutorCourse> lsTutorCourse = [
    TutorCourse("1", "1", "1"),
    TutorCourse("2", "1", "2"),
    TutorCourse("3", "2", "1"),
    TutorCourse("4", "3", "3"),
    TutorCourse("5", "3", "3"),
  ];
}

class TutorCourse {
  String id;
  String idTutor;
  String idCourse;

  TutorCourse(
    this.id,
    this.idTutor,
    this.idCourse,
  );
}
