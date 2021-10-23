import 'package:flutter/material.dart';

import 'profile_form.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: const [
            ProfilePic(),
            SizedBox(height: 20),
            ProfileForm(),
          ],
        ),
      ),
    );
  }
}
