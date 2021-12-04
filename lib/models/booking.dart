import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AppointmentProvider extends ChangeNotifier {
  List<Appointment> _availableAppointments = [];
  static List<Appointment> appointmentList = [
    Appointment(
      id: "1",
      startTime: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 9, 0, 0),
      endTime: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 10, 30, 0),
      subject: 'Book',
      color: Colors.blue,
    ),
    Appointment(
      id: "2",
      startTime: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 9, 0, 0),
      endTime: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 10, 30, 0),
      subject: 'Booked',
      color: Colors.green,
    ),
    Appointment(
      id: "3",
      startTime: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 9, 0, 0),
      endTime: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 10, 30, 0),
      subject: 'Book',
      color: Colors.blue,
    ),
    Appointment(
      id: "4",
      startTime: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day + 1, 9, 0, 0),
      endTime: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day + 1, 10, 30, 0),
      subject: 'Booked',
      color: Colors.green,
    ),
    Appointment(
      id: "5",
      startTime: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day + 1, 9, 0, 0),
      endTime: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day + 1, 10, 30, 0),
      subject: 'Booked',
      color: Colors.green,
    ),
    Appointment(
      id: "6",
      startTime: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day + 1, 9, 0, 0),
      endTime: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day + 1, 10, 30, 0),
      subject: 'Book',
      color: Colors.blue,
    ),
  ];

  Future<void> getAppointments() async {
    _availableAppointments = appointmentList;
  }

  List<Appointment> get appointments => _availableAppointments;

  void isBook(String appointmentId) async {
    Appointment appointmentUpdate =
        _availableAppointments.firstWhere((p) => p.id == appointmentId);
    if (appointmentUpdate.subject == 'Book') {
      appointmentUpdate.subject = 'Booked';
      appointmentUpdate.color = Colors.green;
    } else {
      appointmentUpdate.subject = 'Book';
      appointmentUpdate.color = Colors.blue;
    }
    notifyListeners();
  }
}
