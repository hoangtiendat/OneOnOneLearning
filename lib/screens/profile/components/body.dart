import 'package:flutter/material.dart';

import 'profile_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: ProfileForm(),
      ),
    );
  }
}
