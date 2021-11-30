import 'package:flutter/material.dart';
import 'package:one_on_one_learning/components/custom_bottom_nav_bar.dart';

import '../../size_config.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: const Body(),
      appBar: AppBar(
        title: const Text("Home"),
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: CustomBottomNavBar(indexSelected: 0),
    );
  }
}
