import 'package:flutter/material.dart';
import 'package:one_on_one_learning/models/schedule/schedules.dart';
import 'package:one_on_one_learning/provider/schedule.dart';
import 'package:one_on_one_learning/screens/schedule/components/schedule_tag.dart';

import '../../../size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Future<Schedules> futureSchedules;
  late String strDate = "";
  @override
  void initState() {
    super.initState();
    futureSchedules = ScheduleProvider().fetchSchedules();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<Schedules>(
              future: futureSchedules,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.count,
                    itemBuilder: (context, index) => ScheduleTag(
                      schedule: snapshot.data!.rows![index],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
            // const ScheduleTag(),
            // const ScheduleTag(),
            // const ScheduleTag(),
            // Padding(
            //   padding: EdgeInsets.all(getProportionateScreenWidth(8)),
            //   child: Text(
            //     "2021-10-21",
            //     style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontSize: getProportionateScreenWidth(20)),
            //   ),
            // ),
            // const ScheduleTag(),
            // Padding(
            //   padding: EdgeInsets.all(getProportionateScreenWidth(8)),
            //   child: Text(
            //     "2021-10-20",
            //     style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontSize: getProportionateScreenWidth(20)),
            //   ),
            // ),
            // const ScheduleTag(),
            // const ScheduleTag(),
          ],
        ),
      ),
    );
  }
}
