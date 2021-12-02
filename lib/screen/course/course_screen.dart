import 'package:flutter/material.dart';
import 'package:one_on_one_learning/components/custom_bottom_nav_bar.dart';

import '../../size_config.dart';
import 'components/body.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({Key? key}) : super(key: key);

  static String routeName = "/course_screen";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Courses"),
      ),
      body: const Body(),
      bottomNavigationBar: CustomBottomNavBar(indexSelected: 1),
    );
  }
}
