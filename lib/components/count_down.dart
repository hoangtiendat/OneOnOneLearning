import 'dart:async';

import 'package:flutter/material.dart';

class CountDown extends StatefulWidget {
  final int startTimeStamp; //milliseconds

  const CountDown({
    Key? key,
    required this.startTimeStamp,
  }) : super(key: key);

  @override
  _CountDownState createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  int countDownTime = 0; //seconds
  @override
  void initState() {
    super.initState();
    int range = widget.startTimeStamp - DateTime.now().millisecondsSinceEpoch;
    countDownTime = range > 0 ? (range / 1000).floor() : 0;
    if (range > 0) {
      setUpTimer();
    }
  }

  void setUpTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        int range =
            widget.startTimeStamp - DateTime.now().millisecondsSinceEpoch;
        countDownTime = range > 0 ? (range / 1000).floor() : 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Map times = getTimeFromSeconds(countDownTime);
    return SizedBox(
      // borderColor: AppColor.active,
      child: Column(
        children: <Widget>[
          const Text('Lesson with be started after'),
          const SizedBox(height: 16),
          Text(
            '${times['hours']} : ${times['minutes']} : ${times['seconds']}',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Map<String, String> getTimeFromSeconds(int timeInSeconds) {
    int seconds = timeInSeconds % 60;
    int minutes = (timeInSeconds / 60).floor() % 60;
    int hours = (timeInSeconds / 60 / 60).floor();
    return {
      'seconds': seconds.toString().padLeft(2, '0'),
      'minutes': minutes.toString().padLeft(2, '0'),
      'hours': hours.toString().padLeft(2, '0'),
    };
  }
}
