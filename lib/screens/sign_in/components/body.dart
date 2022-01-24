import 'package:flutter/material.dart';
import 'package:one_on_one_learning/components/no_account_text.dart';
import 'package:one_on_one_learning/components/social_card.dart';
import 'package:one_on_one_learning/utility/constants.dart';

import '../../../utility/size_config.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight! * 0.04),
                Image.asset(
                  "assets/images/logo.png",
                  height: getProportionateScreenHeight(135),
                  width: getProportionateScreenWidth(125),
                ),
                Text(
                  "LET TUTOR",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.04),
                const SignForm(),
                SizedBox(height: SizeConfig.screenHeight! * 0.04),
                Text(
                  "Or continue with",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: getProportionateScreenWidth(16)),
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () {},
                    ),
                    SocialCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                const NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
