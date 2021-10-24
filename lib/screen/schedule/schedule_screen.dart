import 'package:flutter/material.dart';
import 'package:one_on_one_learning/components/custom_bottom_nav_bar.dart';

import '../../enums.dart';
import '../../size_config.dart';
import 'components/body.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  static String routeName = "/schedule_screen";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upcomming"),
        automaticallyImplyLeading: false,
      ),
      body: const Body(),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.upcoming),
    );
  }
}
