import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:one_on_one_learning/models/courses.dart';
import 'package:one_on_one_learning/models/tutor.dart';
import 'package:one_on_one_learning/screens/course/components/course_card.dart';
import 'package:one_on_one_learning/screens/course/course_screen.dart';
import 'package:one_on_one_learning/screens/tutors/components/tutor_card.dart';
import 'package:one_on_one_learning/screens/tutors/tutors_screen.dart';
import 'package:provider/provider.dart';

import '../../../size_config.dart';
import 'home_banner.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Tutor> tutors = Provider.of<TutorProvider>(context, listen: true)
        .search("", "0", false);
    List<Course> courses =
        Provider.of<CourseProvider>(context, listen: true).search(
      "",
      "0",
      "Any Level",
    );
    return SafeArea(
      child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            const HomeBanner(),
            RowRecommend(
              press: () {
                Navigator.popAndPushNamed(context, CourseScreen.routeName);
              },
              text: "Recommended Courses",
            ),
            SizedBox(
              height: getProportionateScreenHeight(380),
              child: courses.isEmpty
                  ? const Center(
                      child: Text(
                        'No tutors.',
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: courses.length,
                      itemBuilder: (context, index) => SizedBox(
                        width: 300,
                        child: CourseCard(
                          course: courses[index],
                          isPop: true,
                        ),
                      ),
                    ),
            ),
            RowRecommend(
              press: () {
                Navigator.popAndPushNamed(context, TutorsScreen.routeName);
              },
              text: "Recommended Tutors",
            ),
            tutors.isEmpty
                ? const Center(
                    child: Text(
                      'No tutors.',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                : ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) => TutorCard(
                      tutor: tutors[index],
                      isPop: false,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class RowRecommend extends StatelessWidget {
  const RowRecommend({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        getProportionateScreenWidth(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(20),
              color: Colors.black,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: press,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
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
    );
  }
}
