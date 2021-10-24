import 'package:flutter/material.dart';
import 'package:one_on_one_learning/components/default_button.dart';
import 'package:one_on_one_learning/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {"text": "Complete profile", "image": "assets/images/splash_1.png"},
    {"text": "Video introduction", "image": "assets/images/splash_2.png"},
    {"text": "Approval", "image": "assets/images/splash_3.png"},
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
                    // SplashContent(
                    //   image: splashData[index]["image"]!,
                    //   text: splashData[index]["text"]!,
                    // ),
                    Text(splashData[index]["text"]!),
              ),
            ),
            DefaultButton(
              text: "Continue",
              press: () {
                setState(() {
                  currentPage = currentPage + 1;
                  pageController.animateToPage(currentPage,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.ease);
                });
              },
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

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);

  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text("TOKYO",
            style: TextStyle(
              fontSize: getProportionateScreenHeight(36),
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            )),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: getProportionateScreenHeight(36),
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(
          flex: 2,
        ),
        // Image.asset(
        //   image,
        //   height: getProportionateScreenHeight(265),
        //   width: getProportionateScreenWidth(235),
        // )
      ],
    );
  }
}
