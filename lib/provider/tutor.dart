import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:one_on_one_learning/models/tutor.dart';
import 'package:http/http.dart' as http;
import 'package:one_on_one_learning/models/tutors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TutorProvider extends ChangeNotifier {
  Tutor? tutorCurr;
  void setTutorCurr(Tutor? tutor) {
    tutorCurr = tutor;
  }

  Tutors? _availableTutors;
  Future<Tutors> getTutors() async {
    _availableTutors ??= await fetchTutors();
    return Future.value(_availableTutors);
  }
  // Future<void> tutorList() async {
  //   var url = Uri.parse('https://sandbox.api.lettutor.com/tutor/search');
  //   var headers = {
  //     'Content-Type': 'application/json',
  //     'Authorization': 'Bearer ${Auth.getToken()}',
  //   };
  //   var response = await http.post(
  //     url,
  //     headers: headers,
  //     body: jsonEncode({}),
  //   );
  //   if (response.statusCode == 200) {
  //     var listTutor = Tutors.fromJson(jsonDecode(response.body));
  //     _availableTutors = listTutor;
  //   }
  // }

  Future<Tutors> fetchTutors() async {
    var url = Uri.parse('https://sandbox.api.lettutor.com/tutor/search');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('accessToken') ?? "";
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await http.post(
      url,
      headers: headers,
      body: jsonEncode({}),
    );
    if (response.statusCode == 200) {
      return Tutors.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  // Tutors? getTutors() {
  //   if (_availableTutors == null) {
  //     tutorList();
  //   }
  //   return _availableTutors;
  // }

  // List<CategoryObj> availableCategories = CategoryModel.categories;

  List<Tutor> search(String searchTerms, String idCategory, bool favoriteList) {
    return _availableTutors!.rows.where((tutor) {
      return tutor.name.toLowerCase().contains(searchTerms.toLowerCase()); //&&
      // (tutor.categories
      //         .where((element) => element.id == idCategory)
      //         .isNotEmpty ||
      //     idCategory == "0") &&
      // (tutor.isFavorite == true || favoriteList == false);
    }).toList();
  }

  void isFavorite(String tutorId) async {
    Tutor? tutorUpdate =
        _availableTutors!.rows.firstWhere((p) => p.id == tutorId);
    // if (tutorUpdate.isFavorite) {
    //   tutorUpdate.isFavorite = false;
    // } else {
    //   tutorUpdate.isFavorite = true;
    // }
    if (tutorCurr?.id == tutorId) {
      tutorCurr = tutorUpdate;
    }
    notifyListeners();
  }
}
