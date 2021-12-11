import 'package:flutter/material.dart';
import 'package:one_on_one_learning/screens/history/history_screen.dart';
import 'package:one_on_one_learning/screens/profile/profile_screen.dart';
import 'package:one_on_one_learning/screens/register_tutor/register_tutor_screen.dart';
import 'package:one_on_one_learning/screens/sign_in/sign_in_screen.dart';
import 'package:one_on_one_learning/size_config.dart';

import 'display_screen.dart';
import 'setting_menu.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            SizedBox(
              width: SizeConfig.screenWidth! * 0.3,
              height: SizeConfig.screenWidth! * 0.3,
              child: const CircleAvatar(
                backgroundImage: AssetImage("assets/images/avatar/avatar3.jpg"),
              ),
            ),
            const SizedBox(height: 20),
            SettingMenu(
              text: "My Account",
              icon: Icons.account_circle,
              press: () =>
                  Navigator.pushNamed(context, ProfileScreen.routeName),
            ),
            SettingMenu(
              text: "Notifications",
              icon: Icons.notifications,
              press: () {},
            ),
            SettingMenu(
              text: "Buy Lessons",
              icon: Icons.local_grocery_store_sharp,
              press: () {},
            ),
            SettingMenu(
              text: "Change Password",
              icon: Icons.vpn_key_rounded,
              press: () {},
            ),
            SettingMenu(
              text: "History",
              icon: Icons.history,
              press: () =>
                  Navigator.pushNamed(context, HistoryScreen.routeName),
            ),
            SettingMenu(
              text: "Become a Tutor",
              icon: Icons.support_agent_rounded,
              press: () =>
                  Navigator.pushNamed(context, RegisterTutorScreen.routeName),
            ),
            SettingMenu(
              text: "Display",
              icon: Icons.settings_display_outlined,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DisplayScreen()),
                );
              },
            ),
            SettingMenu(
              text: "Log Out",
              icon: Icons.logout,
              press: () => Navigator.pushNamed(context, SignInScreen.routeName),
            ),
          ],
        ),
      ),
    );
  }
}
