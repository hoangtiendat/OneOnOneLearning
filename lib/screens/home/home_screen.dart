import 'package:flutter/material.dart';
import 'package:one_on_one_learning/components/custom_bottom_nav_bar.dart';

import '../../utility/size_config.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // String image = Provider.of<AuthProvider>(context).user?.avatar;
    return Scaffold(
      body: const Body(),
      appBar: AppBar(
        title: const Text("Home"),
        // toolbarHeight: SizeConfig.screenWidth! * 0.18,
        // actions: [
        //   IconButton(
        //     padding: const EdgeInsets.all(8.0),
        //     iconSize: SizeConfig.screenWidth! * 0.13,
        //     onPressed: () {},
        //     icon: ImageNet(
        //       urlAvatar: Provider.of<AuthProvider>(context).user?.avatar ?? "",
        //       size: SizeConfig.screenWidth! * 0.13,
        //     ),
        //   ),
        // ],
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: CustomBottomNavBar(indexSelected: 0),
    );
  }
}
