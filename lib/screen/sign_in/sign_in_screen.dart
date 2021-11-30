import 'package:flutter/material.dart';
import 'package:one_on_one_learning/screen/splash/splash_screen.dart';

import '../../size_config.dart';
import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.popAndPushNamed(context, SplashScreen.routeName);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
          ),
        ),
      ),
      body: const Body(),
    );
  }
}
