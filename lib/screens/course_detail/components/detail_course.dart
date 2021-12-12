import 'package:flutter/material.dart';
import 'package:one_on_one_learning/size_config.dart';

import 'text_bold.dart';

class DetailCourse extends StatelessWidget {
  const DetailCourse({
    Key? key,
    required this.levelStr,
  }) : super(key: key);
  final String levelStr;

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
              "The English you need for your work and career.",
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
              children: const [
                Icon(
                  Icons.report_gmailerrorred,
                  color: Colors.blue,
                ),
                Text(
                  "Why should you learn this course?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                )
              ],
            ),
            Text(
              "Under starding business culture and customs is just as important as learning traditional business-related vocabulary. Under starding business culture and customs is just as important as learning traditional business-related vocabulary. Under starding business culture and customs is just as important as learning traditional business-related vocabulary.",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(5),
            ),
            Row(
              children: const [
                Icon(
                  Icons.report_gmailerrorred,
                  color: Colors.blue,
                ),
                Text(
                  "What will you be able to do?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                )
              ],
            ),
            Text(
              "Under starding business culture and customs is just as important as learning traditional business-related vocabulary. Under starding business culture and customs is just as important as learning traditional business-related vocabulary. Under starding business culture and customs is just as important as learning traditional business-related vocabulary.",
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
              levelStr,
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
