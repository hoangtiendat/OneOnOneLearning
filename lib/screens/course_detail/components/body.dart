import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:intl/intl.dart';
import 'package:one_on_one_learning/models/courses.dart';
import 'package:one_on_one_learning/screens/course_detail/components/list_topic.dart';
import 'package:one_on_one_learning/screens/course_detail/components/list_tutor.dart';
import 'package:provider/provider.dart';
import 'detail_course.dart';

import '../../../../../../size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  int topic = 10;
  int tutor = 2;
  var _tabTextIndexSelected = 0;
  // TabController _tabController;
  // @override
  // void initState() {
  //   _tabController = TabController(length: 2, vsync: this);
  //   super.initState();
  // }
  // @override
  // void dispose() {
  //   super.dispose();
  //   _tabController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final course =
        Provider.of<CourseProvider>(context, listen: true).courseCurr;
    return SafeArea(
      child: course == null
          ? const Center(
              child: Text(
                'No data.',
                style: TextStyle(fontSize: 20),
              ),
            )
          : SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(children: [
                Stack(
                  children: [
                    Image(
                      image: AssetImage(course.imageUrl),
                      fit: BoxFit.cover,
                      height: getProportionateScreenWidth(150),
                      width: double.infinity,
                    ),
                    Positioned.fill(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.7)
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: const [0.6, 0.95],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      bottom: 20,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            course.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Text(
                          //   course.category,
                          //   style: const TextStyle(
                          //     color: Colors.white,
                          //     fontSize: 14,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
                DetailCourse(
                  levelStr: course.level,
                ),
                FlutterToggleTab(
                  height: 50,
                  width: 60,
                  borderRadius: 15,
                  selectedIndex: _tabTextIndexSelected,

                  selectedTextStyle: const TextStyle(
                      // color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                  unSelectedTextStyle: const TextStyle(
                      // color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                  labels: [
                    "$topic Topics",
                    Intl.plural(course.tutors.length,
                        zero: "No Tutor",
                        one: "1 Tutor",
                        other: "${course.tutors.length} Tutors"),
                  ],
                  // icons: const [Icons.topic_sharp, Icons.people_alt_outlined],
                  selectedLabelIndex: (index) {
                    setState(() {
                      _tabTextIndexSelected = index;
                    });
                  },
                  isScroll: false,
                ),
                SizedBox(
                  height: getProportionateScreenWidth(10),
                ),
                _tabTextIndexSelected == 0
                    ? const ListTopic()
                    : ListTutor(tutors: course.tutors),
              ]),
            ),
    );
  }
}
