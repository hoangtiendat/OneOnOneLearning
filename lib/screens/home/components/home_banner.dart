import 'package:flutter/material.dart';

import '../../../size_config.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          // horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenWidth(30),
        ),
        decoration: const BoxDecoration(
          color: Colors.blue,
        ),
        child: Column(
          children: [
            styleText("Total lesson time is 12 hours 55 minutes", true),
            SizedBox(
              height: getProportionateScreenWidth(15),
            ),
            styleText("Upcoming Lesson", false),
            SizedBox(
              height: getProportionateScreenWidth(15),
            ),
            styleText("Web, 06, Oct 21 06:30 - 06:55", false),
            SizedBox(
              height: getProportionateScreenWidth(30),
            ),
            // DefaultButton(text: "Enter lesson room", press: () {})
            TextButton(
              style: TextButton.styleFrom(
                shadowColor: Colors.grey,
                elevation: 5,
                primary: Colors.blue,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(getProportionateScreenWidth(50)),
                  side: const BorderSide(color: Colors.blue),
                ),
              ),
              onPressed: () {},
              child: Text(
                "Enter lesson room",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ));
  }

  Text styleText(String text, bool isBold) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        fontSize: getProportionateScreenWidth(16),
      ),
    );
  }
}
