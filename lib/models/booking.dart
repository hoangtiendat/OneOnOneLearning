import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:one_on_one_learning/provider/schedule.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'booking/booking.dart';

enum StatusBooking {
  loading,
  loadAll,
}

class AppointmentProvider extends ChangeNotifier {
  StatusBooking _loadingStatus = StatusBooking.loading;
  void setLoadingStatus(StatusBooking load) {
    _loadingStatus = load;
    notifyListeners();
  }

  get loadingStatus => _loadingStatus;
  List<Appointment> _availableAppointments = [];
  // static List<Appointment> appointmentList = [
  //   Appointment(
  //     id: "1",
  //     startTime: DateTime(DateTime.now().year, DateTime.now().month,
  //         DateTime.now().day, 9, 0, 0),
  //     endTime: DateTime(DateTime.now().year, DateTime.now().month,
  //         DateTime.now().day, 10, 30, 0),
  //     subject: 'Book',
  //     color: Colors.blue,
  //   ),
  //   Appointment(
  //     id: "2",
  //     startTime: DateTime(DateTime.now().year, DateTime.now().month,
  //         DateTime.now().day, 9, 0, 0),
  //     endTime: DateTime(DateTime.now().year, DateTime.now().month,
  //         DateTime.now().day, 10, 30, 0),
  //     subject: 'Booked',
  //     color: Colors.green,
  //   ),
  //   Appointment(
  //     id: "3",
  //     startTime: DateTime(DateTime.now().year, DateTime.now().month,
  //         DateTime.now().day, 9, 0, 0),
  //     endTime: DateTime(DateTime.now().year, DateTime.now().month,
  //         DateTime.now().day, 10, 30, 0),
  //     subject: 'Book',
  //     color: Colors.blue,
  //   ),
  //   Appointment(
  //     id: "4",
  //     startTime: DateTime(DateTime.now().year, DateTime.now().month,
  //         DateTime.now().day + 1, 9, 0, 0),
  //     endTime: DateTime(DateTime.now().year, DateTime.now().month,
  //         DateTime.now().day + 1, 10, 30, 0),
  //     subject: 'Booked',
  //     color: Colors.green,
  //   ),
  //   Appointment(
  //     id: "5",
  //     startTime: DateTime(DateTime.now().year, DateTime.now().month,
  //         DateTime.now().day + 1, 9, 0, 0),
  //     endTime: DateTime(DateTime.now().year, DateTime.now().month,
  //         DateTime.now().day + 1, 10, 30, 0),
  //     subject: 'Booked',
  //     color: Colors.green,
  //   ),
  //   Appointment(
  //     id: "6",
  //     startTime: DateTime(DateTime.now().year, DateTime.now().month,
  //         DateTime.now().day + 1, 9, 0, 0),
  //     endTime: DateTime(DateTime.now().year, DateTime.now().month,
  //         DateTime.now().day + 1, 10, 30, 0),
  //     subject: 'Book',
  //     color: Colors.blue,
  //   ),
  // ];

  Future<void> getAppointments(String tutorId) async {
    setLoadingStatus(StatusBooking.loading);
    List<Booking> bookings = await ScheduleProvider().fetchBookings(tutorId);
    if (bookings.isNotEmpty) {
      _availableAppointments = bookings
          .map(
            (booking) => Appointment(
              id: booking.scheduleDetails![0].id,
              startTime:
                  DateTime.fromMillisecondsSinceEpoch(booking.startTimestamp!),
              endTime:
                  DateTime.fromMillisecondsSinceEpoch(booking.endTimestamp!),
              subject: booking.isBooked! ? "Booked" : "Book",
              color: booking.isBooked! ? Colors.green : Colors.blue,
            ),
          )
          .toList();
      notifyListeners();
    }
    setLoadingStatus(StatusBooking.loadAll);
  }

  List<Appointment> get appointments => _availableAppointments;

  void isBook(String appointmentId) async {
    Appointment appointmentUpdate =
        _availableAppointments.firstWhere((p) => p.id == appointmentId);
    await ScheduleProvider().bookClass(appointmentId);
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
