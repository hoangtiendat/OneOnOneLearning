import 'package:flutter/material.dart';
import 'package:one_on_one_learning/utility/size_config.dart';

import 'countdown_timer.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        color: Colors.black,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: getProportionateScreenWidth(20)),
            const CountdownTimer(),
            Text(
              'Please wait, the tutor will let you in soon.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(30),
                color: Colors.white,
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(20)),
            Text(
              "Start: 2:00PM 24/10/2021",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(30),
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
