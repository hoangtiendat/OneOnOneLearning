import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:one_on_one_learning/models/auth/access.dart';
import 'package:one_on_one_learning/models/course/category.dart';
import 'package:one_on_one_learning/models/course/courses.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../utility/constants.dart';

class CourseProvider extends ChangeNotifier {
  Courses? currentCourses;

  Future<void> setCurrentId(String currentId) async {
    var url = Uri.parse('$urlApi/course/$currentId');
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
      currentCourses = Courses.fromJson(json["data"]);
      notifyListeners();
    } else {
      throw Exception('Failed to load course detail');
    }
  }

  // Future<Courses> fetchCourse() async {
  //   var url = Uri.parse('$urlApi/course/$currentId');
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String token =
  //       Access.fromJson(jsonDecode(prefs.getString('accessToken') ?? "{}"))
  //               .token ??
  //           "";
  //   var headers = {
  //     'Content-Type': 'application/json',
  //     'Authorization': 'Bearer $token',
  //   };
  //   var response = await http.get(
  //     url,
  //     headers: headers,
  //     // body: jsonEncode({}),
  //   );
  //   if (response.statusCode == 200) {
  //     var json = jsonDecode(response.body);
  //     Courses courseDetail = Courses.fromJson(json["data"]);
  //     return courseDetail;
  //   } else {
  //     throw Exception('Failed to load course detail');
  //   }
  // }

  Future<List<Courses>?> fetchCourses(final parameters) async {
    var url = Uri.parse('$urlApi/course').replace(queryParameters: parameters);
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
      List<Courses>? rows;
      if (json["data"]["rows"] != null) {
        rows = <Courses>[];
        json["data"]['rows'].forEach((v) {
          rows!.add(Courses.fromJson(v));
        });
      }
      return rows;
    } else {
      throw Exception('Failed to load course');
    }
  }

  Future<List<Categories>?> fetchCategory(final parameters) async {
    var url = Uri.parse('$urlApi/content-category')
        .replace(queryParameters: parameters);
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
      List<Categories>? rows;
      if (json["rows"] != null) {
        rows = <Categories>[];
        json['rows'].forEach((v) {
          rows!.add(Categories.fromJson(v));
        });
      }
      return rows;
    } else {
      throw Exception('Failed to load category');
    }
  }
}
