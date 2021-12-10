import 'package:flutter/material.dart';
import 'package:one_on_one_learning/components/default_button.dart';
import 'package:one_on_one_learning/screens/register_tutor/components/register_tutor_step.dart';
import 'package:one_on_one_learning/screens/settings/setting_screen.dart';
import 'package:one_on_one_learning/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {"text": "Complete profile"},
    {"text": "Video introduction"},
    {"text": "Approval"},
  ];

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  splashData.length, (index) => buildDot(index: index)),
            ),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) =>
                    RegisterTutorStep(index: index),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(getProportionateScreenWidth(20)),
              child: DefaultButton(
                text: currentPage == 2 ? "Complete" : "Continue",
                press: () {
                  currentPage == 2
                      ? Navigator.pushNamed(context, SettingScreen.routeName)
                      : setState(() {
                          currentPage = currentPage + 1;
                          pageController.animateToPage(currentPage,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.ease);
                        });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(
        right: 5,
      ),
      height: getProportionateScreenWidth(40),
      width: currentPage == index
          ? getProportionateScreenWidth(150)
          : SizeConfig.screenWidth! * 0.1,
      child: TextButton(
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
          currentPage == index
              ? splashData[index]["text"]!
              : (index + 1).toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(15),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
