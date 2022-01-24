import 'package:flutter/material.dart';

import '../../../utility/constants.dart';
import '../../../utility/size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(
          flex: 2,
        ),
        SizedBox(
          width: double.infinity,
          child: Text(
            "|Let \n  Tutor ",
            style: TextStyle(
              fontSize: getProportionateScreenHeight(36),
              color: kPrimaryColor,
            ),
          ),
        ),
        const Spacer(),
        SizedBox(
          width: double.infinity,
          child: Text(
            "English\nLanguage Teaching",
            style: TextStyle(
              fontSize: getProportionateScreenHeight(30),
            ),
          ),
        ),
        const Spacer(
          flex: 2,
        ),
        Image.asset(
          "assets/images/splash.png",
          height: getProportionateScreenHeight(335),
          width: getProportionateScreenWidth(325),
        ),
        const Spacer(
          flex: 2,
        ),
      ],
    );
  }
}
