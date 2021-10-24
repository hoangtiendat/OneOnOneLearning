import 'package:flutter/material.dart';
import 'package:one_on_one_learning/screen/home/home_screen.dart';
import 'package:one_on_one_learning/screen/schedule/schedule_screen.dart';
import 'package:one_on_one_learning/screen/setting/setting_screen.dart';
import 'package:one_on_one_learning/screen/tutors/tutors_screen.dart';
import 'package:one_on_one_learning/size_config.dart';

import '../constants.dart';
import '../enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    const Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: MenuState.home == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                iconSize: getProportionateScreenWidth(30),
                onPressed: () =>
                    Navigator.pushNamed(context, HomeScreen.routeName),
              ),
              IconButton(
                icon: const Icon(
                  Icons.message_rounded,
                  color: inActiveIconColor,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.upcoming_rounded,
                  color: MenuState.upcoming == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, ScheduleScreen.routeName),
              ),
              IconButton(
                icon: Icon(
                  Icons.supervisor_account,
                  color: MenuState.tutors == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, TutorsScreen.routeName),
              ),
              IconButton(
                icon: Icon(
                  Icons.settings,
                  color: MenuState.setting == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, SettingScreen.routeName),
              ),
            ],
          )),
    );
  }
}
