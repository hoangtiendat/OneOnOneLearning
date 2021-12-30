import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:one_on_one_learning/models/courses.dart';
import 'package:one_on_one_learning/models/tutors.dart';
import 'package:one_on_one_learning/provider/tutor.dart';
import 'package:one_on_one_learning/screens/course/components/course_card.dart';
import 'package:one_on_one_learning/screens/course/course_screen.dart';
import 'package:one_on_one_learning/screens/tutors/components/tutor_card.dart';
import 'package:one_on_one_learning/screens/tutors/tutors_screen.dart';
import 'package:provider/provider.dart';

import '../../../size_config.dart';
import 'home_banner.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // late Tutors futureTutors;
  @override
  void initState() {
    super.initState();
    // Provider.of<TutorProvider>(context, listen: false).fetchTutors();
    // futureTutors = Provider.of<TutorProvider>(context, listen: false).tutors;
  }

  // late Tutors? tutors =
  //       Provider.of<TutorProvider>(context, listen: true).getTutors();
  @override
  Widget build(BuildContext context) {
    List<Course> courses = [];

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
              text: "Popular Courses",
            ),
            courses.isEmpty
                ? const Center(
                    child: Text(
                      'No course.',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                : SizedBox(
                    height: 350,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: courses.length,
                      itemBuilder: (context, index) => SizedBox(
                        width: 300,
                        child: CourseCard(
                          course: courses[index],
                          isPop: false,
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
            FutureBuilder<Tutors>(
              future: Provider.of<TutorProvider>(context, listen: false)
                  .getTutors(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.count,
                    itemBuilder: (context, index) => TutorCard(
                      tutor: snapshot.data!.rows[index],
                      isPop: false,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
            // tutors == null
            //     ? const Center(
            //         child: Text(
            //           'No tutors.',
            //           style: TextStyle(fontSize: 20),
            //         ),
            //       )
            //     : ListView.builder(
            //         physics: const NeverScrollableScrollPhysics(),
            //         shrinkWrap: true,
            //         itemCount: tutors.count,
            //         itemBuilder: (context, index) => TutorCard(
            //           tutor: tutors.rows[index],
            //           isPop: false,
            //         ),
            //       ),
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
      padding: EdgeInsets.fromLTRB(
          getProportionateScreenWidth(20),
          getProportionateScreenWidth(20),
          getProportionateScreenWidth(10),
          getProportionateScreenWidth(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(18),
              // color: Colors.black,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: press,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "See More",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: getProportionateScreenWidth(15),
                  ),
                ),
                const Icon(
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
