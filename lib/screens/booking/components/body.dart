import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:one_on_one_learning/models/booking.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    List<Appointment> appointments =
        Provider.of<AppointmentProvider>(context, listen: true).appointments;
    return SafeArea(
      child: Scaffold(
        body: SfCalendar(
          view: CalendarView.schedule,
          firstDayOfWeek: 6,
          dataSource: MeetingDataSource(appointments),
          onTap: calendarTapped,
          showDatePickerButton: true,
          // allowedViews: const <CalendarView>[
          //   CalendarView.day,
          //   CalendarView.week,
          //   CalendarView.workWeek,
          //   CalendarView.month,
          //   CalendarView.schedule
          // ],
          // monthViewSettings: const MonthViewSettings(
          //     appointmentDisplayMode:
          //         MonthAppointmentDisplayMode.appointment,
          //     agendaViewHeight: double.infinity),
          timeSlotViewSettings: const TimeSlotViewSettings(
              timeInterval: Duration(hours: 2),
              timeIntervalHeight: 80,
              timeIntervalWidth: 100),
        ),
      ),
    );
  }

  void calendarTapped(CalendarTapDetails details) {
    if (details.targetElement == CalendarElement.appointment) {
      final app = (details.appointments as List)
          .map((item) => item as Appointment)
          .toList();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: app[0].subject == 'Booked'
                ? const Text("Cancel this course")
                : const Text("Book this course"),
            content: Text(DateFormat('EEEE dd, MMMM yyyy')
                .format(details.date!)
                .toString()),
            actions: [
              TextButton(
                onPressed: () {
                  // Provider.of<AppointmentProvider>(context, listen: false)
                  //     .isBook(app[0].id as String);
                  context
                      .read<AppointmentProvider>()
                      .isBook(app[0].id as String);
                  Navigator.of(context).pop();
                },
                child: const Text('ok'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('close'),
              ),
            ],
          );
        },
      );
    }
  }
}

// List<Appointment> getAppointments() {
//   List<Appointment> meetings = <Appointment>[];
//   final DateTime today = DateTime.now();
//   final DateTime startTime =
//       DateTime(today.year, today.month, today.day, 9, 0, 0);
//   final DateTime endTime = startTime.add(const Duration(hours: 2));

//   meetings.add(
//     Appointment(
//       id: "1",
//       startTime: startTime,
//       endTime: endTime,
//       subject: 'Book',
//       color: Colors.blue,
//       // recurrenceRule: 'FREQ=DAILY;COUNT=10',
//       // isAllDay: true,
//     ),
//   );

//   meetings.add(Appointment(
//       id: "2",
//       subject: 'meeting',
//       startTime: DateTime(2021, 12, 03, 10),
//       endTime: DateTime(2021, 12, 03, 12),
//       color: Colors.green,
//       isAllDay: false));

//   return meetings;
// }

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
