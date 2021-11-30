import 'package:flutter/foundation.dart';
import 'package:one_on_one_learning/models/category.dart';

class TutorProvider extends ChangeNotifier {
  Tutor? tutorCurr;
  void setTutorCurr(Tutor? tutor) {
    tutorCurr = tutor;
  }

  List<Tutor> _availableTutors = [];
  List<Tutor> tutorList = [
    Tutor(
      "1",
      "assets/images/avatar/avatar1.jpg",
      "Hai Pham Hoang",
      false,
      [
        CategoryObj("1", "ek", "English for kids", "English for kids",
            "2021-06-10T14:54:31.964Z", "2021-06-10T14:54:31.964Z"),
        CategoryObj("2", "eb", "English for Business", "English for Business",
            "2021-06-10T14:54:31.964Z", "2021-06-10T14:54:31.964Z"),
      ],
    ),
    Tutor(
      "2",
      "assets/images/avatar/avatar2.jpg",
      "Bao Chau",
      true,
      [
        CategoryObj("2", "eb", "English for Business", "English for Business",
            "2021-06-10T14:54:31.964Z", "2021-06-10T14:54:31.964Z"),
        CategoryObj("3", "cs", "Conversational", "Conversational",
            "2021-06-10T14:54:31.964Z", "2021-06-10T14:54:31.964Z"),
      ],
    ),
    Tutor(
      "3",
      "assets/images/avatar/avatar3.jpg",
      "Phan Thanh",
      true,
      [
        CategoryObj("4", "ie", "IELTS", "IELTS", "2021-06-10T14:54:31.964Z",
            "2021-06-10T14:54:31.964Z"),
        CategoryObj("5", "tf", "TOEFL", "TOEFL", "2021-06-10T14:54:31.964Z",
            "2021-06-10T14:54:31.964Z"),
        CategoryObj("6", "te", "TOEIC", "TOEIC", "2021-06-10T14:54:31.964Z",
            "2021-06-10T14:54:31.964Z"),
      ],
    ),
    Tutor(
      "4",
      "assets/images/avatar/avatar4.jpg",
      "Nhi Lam",
      false,
      [
        CategoryObj("3", "cs", "Conversational", "Conversational",
            "2021-06-10T14:54:31.964Z", "2021-06-10T14:54:31.964Z"),
      ],
    ),
    Tutor(
      "5",
      "assets/images/avatar/avatar5.jpg",
      "Khang Nguyen",
      true,
      [
        CategoryObj("2", "eb", "English for Business", "English for Business",
            "2021-06-10T14:54:31.964Z", "2021-06-10T14:54:31.964Z"),
        CategoryObj("6", "te", "TOEIC", "TOEIC", "2021-06-10T14:54:31.964Z",
            "2021-06-10T14:54:31.964Z"),
      ],
    ),
    Tutor(
      "6",
      "assets/images/avatar/avatar6.jpg",
      "Anh Tu",
      false,
      [
        CategoryObj("1", "ek", "English for kids", "English for kids",
            "2021-06-10T14:54:31.964Z", "2021-06-10T14:54:31.964Z"),
      ],
    ),
  ];
  List<CategoryObj> availableCategories = CategoryModel.categories;

  Future<void> getTutors() async {
    _availableTutors = tutorList;
  }

  List<Tutor> search(String searchTerms, String idCategory) {
    return _availableTutors.where((tutor) {
      return tutor.name.toLowerCase().contains(searchTerms.toLowerCase()) &&
          (tutor.categories
                  .where((element) => element.id == idCategory)
                  .isNotEmpty ||
              idCategory == "0");
    }).toList();
  }

  void isFavorite(String tutorId) async {
    Tutor tutorUpdate = _availableTutors.firstWhere((p) => p.id == tutorId);
    if (tutorUpdate.isFavorite) {
      tutorUpdate.isFavorite = false;
    } else {
      tutorUpdate.isFavorite = true;
    }
    if (tutorCurr!.id == tutorId) {
      tutorCurr = tutorUpdate;
    }
    //  else {
    //   if (tutorCurr!.isFavorite) {
    //     tutorCurr!.isFavorite = false;
    //   } else {
    //     tutorCurr!.isFavorite = true;
    //   }
    // }
    notifyListeners();
  }

  // void selectCategories(String categoryId) async {
  //   CategoryObj categoryUpdate = availableCategories.firstWhere((p) => p.id == categoryId);
  //   if (tutorUpdate.isFavorite) {
  //     tutorUpdate.isFavorite = false;
  //   } else {
  //     tutorUpdate.isFavorite = true;
  //   }
  //   notifyListeners();
  // }
}

class Tutor {
  String id;
  String avatar;
  // final String video;
  String name;
  // final String country;
  // final String bio;
  // final String education;
  // final String experience;
  // final String profession;
  // final String interests;
  // final String languages;
  // final String specialties;
  bool isFavorite;
  // final double avgRating;
  List<CategoryObj> categories;

  Tutor(
    this.id,
    this.avatar,
    // this.video,
    this.name,
    // this.country,
    // this.bio,
    // this.education,
    // this.experience,
    // this.profession,
    // this.interests,
    // this.languages,
    // this.specialties,
    this.isFavorite,
    this.categories,
    // this.avgRating,
  );
}
