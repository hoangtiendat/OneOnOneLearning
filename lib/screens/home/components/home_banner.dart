import 'package:flutter/material.dart';
import 'package:one_on_one_learning/provider/tutor.dart';

import '../../../utility/size_config.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  late Future<int> totalCall;
  @override
  void initState() {
    super.initState();
    totalCall = TutorProvider().getTotal();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenWidth(30),
        ),
        decoration: const BoxDecoration(
          color: Colors.blue,
        ),
        child: Column(
          children: [
            FutureBuilder<int>(
              future: totalCall,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  String text = "";
                  if (snapshot.data! > 0) {
                    text =
                        'Total lesson time is ${snapshot.data! ~/ 60 > 0 ? '${snapshot.data! ~/ 60} hours ' : ''} ${snapshot.data! % 60 > 0 ? '${snapshot.data! % 60} minutes' : ''} ';
                  } else {
                    text = "Welcome to LetTutor!";
                  }
                  return styleText(text, true);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),

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
