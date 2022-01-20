import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'package:one_on_one_learning/models/booking.dart';
import 'package:one_on_one_learning/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    AppointmentProvider auth = Provider.of<AppointmentProvider>(context);
    List<Appointment> appointments =
        Provider.of<AppointmentProvider>(context, listen: true).appointments;

    final loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: getProportionateScreenHeight(250),
        ),
        const CircularProgressIndicator(),
        Text(
          " Loading ... Please wait",
          style: TextStyle(fontSize: getProportionateScreenWidth(20)),
        )
      ],
    );
    return SafeArea(
      child: auth.loadingStatus == StatusBooking.loading
          ? loading
          : Scaffold(
              body: SfCalendar(
                initialDisplayDate: DateTime.now(),
                view: CalendarView.schedule,
                firstDayOfWeek: 6,
                dataSource: MeetingDataSource(appointments),
                onTap: calendarTapped,
                showDatePickerButton: true,
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
            title: const Text("Booking details"),
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

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
