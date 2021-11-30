import 'package:flutter/material.dart';
import 'package:one_on_one_learning/components/custom_bottom_nav_bar.dart';

import '../../size_config.dart';
import 'components/body.dart';

class TutorsScreen extends StatelessWidget {
  const TutorsScreen({Key? key}) : super(key: key);
  static String routeName = "/tutors_screen";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tutors"),
        automaticallyImplyLeading: false,
      ),
      body: const Body(),
      bottomNavigationBar: CustomBottomNavBar(indexSelected: 3),
    );
  }
}
