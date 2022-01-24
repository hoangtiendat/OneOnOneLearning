import 'package:flutter/material.dart';
import 'package:one_on_one_learning/components/image_net.dart';
import 'package:one_on_one_learning/models/auth/user.dart';
import 'package:one_on_one_learning/provider/auth.dart';
import 'package:one_on_one_learning/screens/history/history_screen.dart';
import 'package:one_on_one_learning/screens/profile/profile_screen.dart';
import 'package:one_on_one_learning/screens/register_tutor/register_tutor_screen.dart';
import 'package:one_on_one_learning/screens/settings/components/change_password.dart';
import 'package:one_on_one_learning/screens/settings/components/favorite_tutors.dart';
import 'package:one_on_one_learning/screens/sign_in/sign_in_screen.dart';
import 'package:one_on_one_learning/utility/size_config.dart';

import 'display_screen.dart';
import 'setting_menu.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Future<User> user;

  @override
  void initState() {
    super.initState();
    user = AuthProvider().fetchUserV2();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            FutureBuilder<User>(
              future: user,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ImageNet(
                    urlAvatar: snapshot.data!.avatar!,
                    size: SizeConfig.screenWidth! * 0.3,
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
            const SizedBox(height: 20),
            SettingMenu(
              text: "My Account",
              icon: Icons.account_circle,
              press: () =>
                  Navigator.pushNamed(context, ProfileScreen.routeName),
            ),
            SettingMenu(
              text: "Favorite Tutors",
              icon: Icons.favorite_outlined,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FavoriteTutors()),
                );
              },
            ),
            SettingMenu(
              text: "Change Password",
              icon: Icons.vpn_key_rounded,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ChangePasswordScreen()),
                );
              },
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
              text: "Advanced Settings",
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
