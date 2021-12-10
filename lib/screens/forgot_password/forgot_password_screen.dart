import 'package:flutter/material.dart';
import 'package:one_on_one_learning/screens/sign_in/sign_in_screen.dart';
import 'components/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  static String routeName = "/forgot_pasword";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot password"),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.popAndPushNamed(context, SignInScreen.routeName);
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
