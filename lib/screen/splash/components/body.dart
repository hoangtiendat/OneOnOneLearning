import 'package:flutter/material.dart';
import 'package:one_on_one_learning/screen/sign_in/sign_in_screen.dart';


import '../../../size_config.dart';
import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: SplashContent(),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                width: SizeConfig.screenWidth! * 0.45,
                child: Column(
                  children: [
                    DefaultButton(
                      text: "Get Stated",
                      press: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
          ),
      ),
    );
  }
}



