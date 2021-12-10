import 'package:flutter/material.dart';
import 'package:one_on_one_learning/screens/schedule/components/schedule_tag.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(getProportionateScreenWidth(8)),
              child: Text(
                "2021-10-22",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(20)),
              ),
            ),
            const ScheduleTag(),
            const ScheduleTag(),
            const ScheduleTag(),
            Padding(
              padding: EdgeInsets.all(getProportionateScreenWidth(8)),
              child: Text(
                "2021-10-21",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(20)),
              ),
            ),
            const ScheduleTag(),
            Padding(
              padding: EdgeInsets.all(getProportionateScreenWidth(8)),
              child: Text(
                "2021-10-20",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(20)),
              ),
            ),
            const ScheduleTag(),
            const ScheduleTag(),
          ],
        ),
      ),
    );
  }
}
