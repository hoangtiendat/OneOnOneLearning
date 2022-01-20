import 'package:flutter/material.dart';
import 'package:one_on_one_learning/models/course/courses.dart';
import 'package:one_on_one_learning/size_config.dart';

import 'text_bold.dart';

class DetailCourse extends StatelessWidget {
  const DetailCourse({
    Key? key,
    required this.course,
  }) : super(key: key);
  final Courses course;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextBold(
              text: "About Course",
              color: Colors.blue,
            ),
            Text(
              course.description!,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            const TextBold(
              text: "Overview",
              color: Colors.blue,
            ),
            SizedBox(
              height: getProportionateScreenWidth(5),
            ),
            Row(
              children: [
                const Icon(
                  Icons.report_gmailerrorred,
                  color: Colors.blue,
                ),
                Text(
                  "Why should you learn this course?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: getProportionateScreenWidth(18),
                  ),
                )
              ],
            ),
            Text(
              course.reason!,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(5),
            ),
            Row(
              children: [
                const Icon(
                  Icons.report_gmailerrorred,
                  color: Colors.blue,
                ),
                Text(
                  "What will you be able to do?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: getProportionateScreenWidth(18),
                  ),
                )
              ],
            ),
            Text(
              course.purpose!,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            const TextBold(
              text: "Level",
              color: Colors.blue,
            ),
            Text(
              course.level!,
              style: TextStyle(fontSize: getProportionateScreenWidth(20)),
            ),
            SizedBox(
              height: getProportionateScreenWidth(10),
            ),
          ],
        ),
      ),
    );
  }
}
