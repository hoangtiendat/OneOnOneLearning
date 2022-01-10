import 'dart:convert';
import 'package:one_on_one_learning/models/access.dart';
import 'package:one_on_one_learning/models/schedule/schedules.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class ScheduleProvider {
  Future<Schedules> fetchSchedules() async {
    final parameters = {
      "page": "1",
      "perPage": "20",
      "dateTimeGte": "1641820192283",
      "orderBy": "meeting",
      "sortBy": "asc"
    };
    var url = Uri.parse('$urlApi/booking/list/student')
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
      Schedules newSchedules = Schedules.fromJson(json["data"]);
      return newSchedules;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
