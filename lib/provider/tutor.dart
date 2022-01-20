import 'package:flutter/foundation.dart';
import 'package:one_on_one_learning/constants.dart';
import 'package:one_on_one_learning/models/auth/access.dart';
import 'package:one_on_one_learning/models/rows.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:one_on_one_learning/models/tutor/tutor.dart';
import 'package:one_on_one_learning/models/tutors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TutorProvider extends ChangeNotifier {
  Tutor? _tutorCurr;

  get tutorCurr => _tutorCurr;

  bool _loadingFav = false;
  void setLoadingFav(bool loadingFav) {
    _loadingFav = loadingFav;
    notifyListeners();
  }

  get loadingFav => _loadingFav;

  Tutors? _availableTutors;
  Future<Tutors> getTutors() async {
    _availableTutors ??= await fetchTutors();
    return Future.value(_availableTutors);
  }

  Future<List<Rows>?> searchTutors(final parameters) async {
    var url = Uri.parse('$urlApi/tutor/search');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token =
        Access.fromJson(jsonDecode(prefs.getString('accessToken') ?? "{}"))
                .token ??
            "";
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(parameters),
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      Tutors newTutorList = Tutors.fromJson(json);
      return newTutorList.rows;
    } else {
      throw Exception('Failed to load course');
    }
  }

  Future<Tutors> fetchTutors() async {
    var url = Uri.parse('$urlApi/tutor/more?perPage=9&page=1');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token =
        Access.fromJson(jsonDecode(prefs.getString('accessToken') ?? "{}"))
                .token ??
            "";
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await http.get(
      url,
      headers: headers,
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      Tutors newTutorList = Tutors.fromJson(json["tutors"]);
      List<dynamic> favoriteIdList = json['favoriteTutor']
          .map((fTutorJson) => fTutorJson['secondId'])
          .toList();
      for (var tutor in newTutorList.rows) {
        tutor.isFavorite = favoriteIdList.contains(tutor.userId);
      }
      return newTutorList;
    } else {
      throw Exception('Failed to load tutor');
    }
  }

  Future<Tutors> fetchFavTutors() async {
    var url = Uri.parse('$urlApi/tutor/more?perPage=9&page=1');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token =
        Access.fromJson(jsonDecode(prefs.getString('accessToken') ?? "{}"))
                .token ??
            "";
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await http.get(
      url,
      headers: headers,
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      Tutors newTutorList = Tutors.fromJson(json["tutors"]);
      List<dynamic> favoriteIdList = json['favoriteTutor']
          .map((fTutorJson) => fTutorJson['secondId'])
          .toList();
      for (var tutor in newTutorList.rows) {
        tutor.isFavorite = favoriteIdList.contains(tutor.userId);
      }
      List<Rows> tutorLs =
          newTutorList.rows.where((element) => element.isFavorite!).toList();
      Tutors favTutors = Tutors(tutorLs.length, tutorLs);
      return favTutors;
    } else {
      throw Exception('Failed to load tutor');
    }
  }

  Future<void> manageFavoriteTutor(String tutorId) async {
    var url = Uri.parse('$urlApi/user/manageFavoriteTutor');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token =
        Access.fromJson(jsonDecode(prefs.getString('accessToken') ?? "{}"))
                .token ??
            "";
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await http.post(
      url,
      headers: headers,
      body: jsonEncode({"tutorId": tutorId}),
    );
    // Rows? tutorUpdate =
    //     _availableTutors!.rows.firstWhere((p) => p.userId == tutorId);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      try {
        json["result"] as int;
        // tutorUpdate.isFavorite = false;
      } catch (e) {
        // tutorUpdate.isFavorite = true;
      }
      notifyListeners();
    } else {
      throw Exception('Failed to load list tutor');
    }
  }

  Future<void> fetchTutor(String idTutor) async {
    var url = Uri.parse('$urlApi/tutor/$idTutor');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token =
        Access.fromJson(jsonDecode(prefs.getString('accessToken') ?? "{}"))
                .token ??
            "";
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await http.get(
      url,
      headers: headers,
      // body: jsonEncode({}),
    );
    if (response.statusCode == 200) {
      Tutor newTutorList = Tutor.fromJson(jsonDecode(response.body));
      _tutorCurr = newTutorList;
      notifyListeners();
    } else {
      throw Exception('Failed to load tutor');
    }
  }

  Future<int> getTotal() async {
    var url = Uri.parse('$urlApi/call/total');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token =
        Access.fromJson(jsonDecode(prefs.getString('accessToken') ?? "{}"))
                .token ??
            "";
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await http.get(
      url,
      headers: headers,
      // body: jsonEncode({}),
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      int totalCall = json["total"];
      return totalCall;
    } else {
      throw Exception('Failed to load album');
    }
  }

  List<Rows> search(String searchTerms, String idCategory, bool favoriteList) {
    return _availableTutors!.rows.where((tutor) {
      return tutor.name!.toLowerCase().contains(searchTerms.toLowerCase()); //&&
      // (tutor.categories
      //         .where((element) => element.id == idCategory)
      //         .isNotEmpty ||
      //     idCategory == "0") &&
      // (tutor.isFavorite == true || favoriteList == false);
    }).toList();
  }
}
