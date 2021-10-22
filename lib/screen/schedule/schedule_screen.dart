import 'package:flutter/material.dart';

import '../../size_config.dart';
import 'components/body.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({ Key? key }) : super(key: key);

  static String routeName = "/schedule_screen";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: Body(),
    );
  }
}