import 'package:flutter/material.dart';
import 'package:one_on_one_learning/screen/tutors/components/tutor_card.dart';

import '../../../size_config.dart';
import 'home_banner.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            HomeBanner(),
            Padding(
              padding: EdgeInsets.all(
                getProportionateScreenWidth(20),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recommended Tutors",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(20),
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: const [
                            Text(
                              "See More",
                              style: TextStyle(color: Colors.blue),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.blue,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: getProportionateScreenWidth(30)),
                        const TutorCard(),
                        const TutorCard(),
                        const TutorCard(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
