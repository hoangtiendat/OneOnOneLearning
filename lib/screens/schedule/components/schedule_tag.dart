import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:one_on_one_learning/components/image_net.dart';
import 'package:one_on_one_learning/models/schedule/schedule.dart';
import 'package:one_on_one_learning/provider/schedule.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'from_to_time.dart';

class ScheduleTag extends StatelessWidget {
  const ScheduleTag({
    Key? key,
    required this.schedule,
  }) : super(key: key);
  final Schedule schedule;

  @override
  Widget build(BuildContext context) {
    final f = DateFormat('yyyy - MM - dd');
    bool isCancle = DateTime.now().add(const Duration(hours: 2)).isBefore(
        DateTime.fromMillisecondsSinceEpoch(
            schedule.scheduleDetailInfo!.startPeriodTimestamp!));
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenWidth(8),
          horizontal: getProportionateScreenWidth(16)),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(15)),
          child: Column(
            children: [
              DateString(
                date: f.format(DateTime.fromMillisecondsSinceEpoch(
                    schedule.scheduleDetailInfo!.startPeriodTimestamp!)),
              ),
              Row(
                children: [
                  ImageNet(
                      size: getProportionateScreenWidth(50),
                      urlAvatar: schedule.scheduleDetailInfo!.scheduleInfo!
                          .tutorInfo!.avatar!),
                  SizedBox(
                    width: getProportionateScreenWidth(15),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        schedule
                            .scheduleDetailInfo!.scheduleInfo!.tutorInfo!.name!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kTextColor,
                            fontSize: getProportionateScreenWidth(20)),
                      ),
                      FromToTime(
                          startPeriod: schedule
                              .scheduleDetailInfo!.startPeriodTimestamp!,
                          endPeriod:
                              schedule.scheduleDetailInfo!.endPeriodTimestamp!),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: getProportionateScreenWidth(15),
              ),
              SizedBox(
                height: getProportionateScreenHeight(35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: getProportionateScreenWidth(130),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: isCancle ? Colors.red : Colors.grey,
                          side: BorderSide(
                              color: isCancle ? Colors.red : Colors.grey),
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.all(0),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text(
                                    "Are you sure cancel this session?"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('No'),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      // Provider.of<AppointmentProvider>(context, listen: false)
                                      //     .isBook(app[0].id as String);
                                      await ScheduleProvider().cancleBook(
                                          schedule.scheduleDetailInfo!.id!);
                                      // context
                                      //     .read<AppointmentProvider>()
                                      //     .isBook(app[0].id as String);
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Yes'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(15),
                            fontWeight: FontWeight.bold,
                            color: isCancle ? Colors.red : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(130),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.white,
                          side: BorderSide(
                              color: isCancle ? Colors.grey : Colors.blue),
                          backgroundColor: isCancle ? Colors.grey : Colors.blue,
                          padding: const EdgeInsets.all(0),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Go to Meeting",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(15),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DateString extends StatelessWidget {
  const DateString({
    Key? key,
    required this.date,
  }) : super(key: key);
  final String date;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        date,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: getProportionateScreenWidth(18)),
        textAlign: TextAlign.right,
      ),
    );
  }
}
