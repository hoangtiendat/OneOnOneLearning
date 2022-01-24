import 'package:flutter/material.dart';
import 'package:one_on_one_learning/components/custom_bottom_nav_bar.dart';

import '../../utility/size_config.dart';
import 'components/body.dart';

class SettingScreen extends StatelessWidget {
  static String routeName = "/setting";

  const SettingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: const Body(),
      bottomNavigationBar: CustomBottomNavBar(indexSelected: 4),
    );
  }
}
