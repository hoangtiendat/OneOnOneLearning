import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:one_on_one_learning/components/image_net.dart';
import 'package:one_on_one_learning/provider/auth_provider.dart';
import 'package:one_on_one_learning/screens/history/history_screen.dart';
import 'package:one_on_one_learning/screens/profile/profile_screen.dart';
import 'package:one_on_one_learning/screens/register_tutor/register_tutor_screen.dart';
import 'package:one_on_one_learning/screens/settings/components/change_password.dart';
import 'package:one_on_one_learning/screens/sign_in/sign_in_screen.dart';
import 'package:one_on_one_learning/size_config.dart';
import 'package:provider/provider.dart';

import 'display_screen.dart';
import 'setting_menu.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String avatar = Provider.of<AuthProvider>(context).user!.avatar;
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            ImageNet(
              urlAvatar: avatar,
              size: SizeConfig.screenWidth! * 0.3,
            ),
            // SizedBox(
            //   width: SizeConfig.screenWidth! * 0.3,
            //   height: SizeConfig.screenWidth! * 0.3,
            //   child:
            //       CachedNetworkImage(
            //     imageUrl: avatar,
            //     imageBuilder: (context, imageProvider) => Container(
            //       decoration: BoxDecoration(
            //         borderRadius:
            //             BorderRadius.circular(SizeConfig.screenWidth! * 0.15),
            //         image: DecorationImage(
            //           image: imageProvider,
            //           fit: BoxFit.cover,
            //           // colorFilter:
            //           //     ColorFilter.mode(Colors.red, BlendMode.colorBurn),
            //         ),
            //       ),
            //     ),
            //     placeholder: (context, url) =>
            //         const CircularProgressIndicator(),
            //     errorWidget: (context, url, error) => const Icon(Icons.error),
            //   ),
            // ),
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
