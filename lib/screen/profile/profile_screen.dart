import 'package:flutter/material.dart';
import 'package:one_on_one_learning/screen/setting/setting_screen.dart';

import '../../size_config.dart';
import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";

  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: const Body(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          elevation: 0,
          backgroundColor: Colors.grey.withOpacity(0.6),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.blue,
            size: getProportionateScreenWidth(35),
          ),
          onPressed: () =>
              Navigator.popAndPushNamed(context, SettingScreen.routeName),
        ),
      ),
    );
  }
}
