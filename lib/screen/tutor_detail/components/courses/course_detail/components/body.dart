import 'package:flutter/material.dart';
import 'package:one_on_one_learning/screen/tutor_detail/components/courses/course_detail/components/detail_course.dart';

import '../../../../../../size_config.dart';
import 'info_course.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: getProportionateScreenWidth(180),
            width: double.infinity,
            child: Image.network(
              "https://www.businessenglishsite.com/new-home-image.jpg",
              fit: BoxFit.fitHeight,
            ),
          ),
          const InfoCourse(),
          const DetailCourse()
        ]),
      ),
    );
  }
}
