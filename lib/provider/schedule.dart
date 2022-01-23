import 'dart:convert';
import 'package:one_on_one_learning/models/auth/access.dart';
import 'package:one_on_one_learning/models/booking/booking.dart';
import 'package:one_on_one_learning/models/booking/booking_tutor.dart';
import 'package:one_on_one_learning/models/course/courses.dart';
import 'package:one_on_one_learning/models/schedule/schedule.dart';
import 'package:one_on_one_learning/models/schedule/schedules.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class ScheduleProvider {
  Future<List<Schedule>?> fetchSchedules(final parameters) async {
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
      return newSchedules.rows;
    } else {
      throw Exception('Failed to load schedules');
    }
  }

  Future<List<Booking>> fetchBookings(String tutorId) async {
    var url = Uri.parse('$urlApi/schedule');
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
    if (response.statusCode == 200) {
      BookingTutor bookTutor = BookingTutor.fromJson(jsonDecode(response.body));
      // List<Booking> data = [];
      // json['data'].forEach((v) {
      //   data.add(Booking.fromJson(v));
      // });
      return bookTutor.data!;
    } else {
      throw Exception('Failed to load bookings');
    }
  }

  Future<void> bookClass(String id) async {
    var url = Uri.parse('$urlApi/booking');
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
      body: jsonEncode({
        "scheduleDetailIds": [id],
        "note": ""
      }),
    );
    if (response.statusCode == 200) {
      // var json = jsonDecode(response.body);
      // List<Booking> data = [];
      // json['data'].forEach((v) {
      //   data.add(Booking.fromJson(v));
      // });
      // return data;
    } else {
      throw Exception('Failed to book class');
    }
  }

  Future<void> cancleBook(String id) async {
    var url = Uri.parse('$urlApi/booking');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token =
        Access.fromJson(jsonDecode(prefs.getString('accessToken') ?? "{}"))
                .token ??
            "";
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await http.delete(
      url,
      headers: headers,
      body: jsonEncode({
        "scheduleDetailIds": [id]
      }),
    );
    if (response.statusCode == 200) {
      // var json = jsonDecode(response.body);
      // List<Booking> data = [];
      // json['data'].forEach((v) {
      //   data.add(Booking.fromJson(v));
      // });
      // return data;
    } else {
      throw Exception('Failed to book class');
    }
  }

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
}
