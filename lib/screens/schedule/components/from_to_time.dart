import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:one_on_one_learning/constants.dart';

import '../../../size_config.dart';

class FromToTime extends StatelessWidget {
  const FromToTime({
    Key? key,
    required this.startPeriod,
    required this.endPeriod,
  }) : super(key: key);
  final int startPeriod;
  final int endPeriod;

  @override
  Widget build(BuildContext context) {
    final f = DateFormat('HH:mm');
    String startTime =
        f.format(DateTime.fromMillisecondsSinceEpoch(startPeriod));
    // '${DateTime.fromMillisecondsSinceEpoch(startPeriod).hour}:${DateTime.fromMillisecondsSinceEpoch(startPeriod).minute}';
    String endTime = f.format(DateTime.fromMillisecondsSinceEpoch(endPeriod));
    // '${DateTime.fromMillisecondsSinceEpoch(endPeriod).hour}:${DateTime.fromMillisecondsSinceEpoch(endPeriod).minute}';
    return Row(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(40),
          height: getProportionateScreenHeight(20),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              primary: Colors.blue,
              side: const BorderSide(color: Colors.blue),
              backgroundColor: Colors.blue[100],
              padding: const EdgeInsets.all(0),
            ),
            onPressed: () {},
            child: Text(
              startTime,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(10),
              ),
            ),
          ),
        ),
        Icon(
          Icons.arrow_forward_rounded,
          size: getProportionateScreenHeight(18),
          color: kTextColor,
        ),
        SizedBox(
          width: getProportionateScreenWidth(40),
          height: getProportionateScreenHeight(20),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              primary: Colors.orange,
              side: const BorderSide(color: Colors.orange),
              backgroundColor: Colors.orange[100],
              padding: const EdgeInsets.all(0),
            ),
            onPressed: () {},
            child: Text(
              endTime,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
