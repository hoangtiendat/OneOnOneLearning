import 'package:flutter/material.dart';
import 'package:one_on_one_learning/components/default_button.dart';
import 'package:one_on_one_learning/screen/profile/components/profile_form.dart';
import 'package:one_on_one_learning/screen/profile/components/profile_pic.dart';
import 'package:one_on_one_learning/screen/setting/setting_screen.dart';
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
      // width: ,
      width: currentPage == index
          ? getProportionateScreenWidth(150)
          : SizeConfig.screenWidth! * 0.1,
      // decoration: BoxDecoration(
      //   color: currentPage == index ? Colors.blue : const Color(0xFFD8D8D8),
      //   borderRadius: BorderRadius.circular(3),
      // ),
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
      // child: currentPage == index
      //     ? Center(
      //         child: Text(
      //           splashData[index]["text"]!,
      //           textAlign: TextAlign.center,
      //           style: const TextStyle(
      //             color: Colors.white,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       )
      //     : Center(
      //         child: Text(
      //           (index + 1).toString(),
      //           textAlign: TextAlign.center,
      //           style: const TextStyle(
      //             color: Colors.white,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ),
    );
  }
}

class RegisterTutorStep extends StatelessWidget {
  const RegisterTutorStep({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: const [
            ProfilePic(),
            SizedBox(height: 20),
            ProfileForm(),
          ],
        ),
      );
    } else if (index == 1) {
      return Icon(
        Icons.smart_display_rounded,
        size: getProportionateScreenHeight(200),
      );
    } else {
      return Column(
        children: [
          SizedBox(height: getProportionateScreenWidth(30)),
          Icon(
            Icons.sentiment_satisfied_alt_outlined,
            size: getProportionateScreenWidth(100),
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          Text(
            "You have done all the steps",
            style: TextStyle(
              fontSize: getProportionateScreenHeight(30),
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          Text(
            "Please, wait for the operator's approval.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: getProportionateScreenHeight(30),
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    }
  }
}
