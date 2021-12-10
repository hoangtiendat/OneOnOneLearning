import 'package:flutter/material.dart';
import 'package:one_on_one_learning/size_config.dart';

import 'components/body.dart';

class RegisterTutorScreen extends StatelessWidget {
  const RegisterTutorScreen({Key? key}) : super(key: key);
  static String routeName = "/register_tutor";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Become to Tutor"),
      ),
      body: const Body(),
    );
  }
}
