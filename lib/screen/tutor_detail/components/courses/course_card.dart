import 'package:flutter/material.dart';
import 'package:one_on_one_learning/components/outlined_button_no_icon.dart';
import 'package:one_on_one_learning/screen/tutor_detail/components/courses/course_detail/course_detail_screen.dart';

import '../../../../size_config.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(15)),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: SizedBox(
          width: getProportionateScreenWidth(200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.network(
                  "https://www.businessenglishsite.com/new-home-image.jpg",
                ),
              ),
              Padding(
                padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Business English",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenWidth(20),
                          color: Colors.black),
                    ),
                    Text(
                      "The English you need for your work and career.",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(15),
                          color: Colors.grey[700]),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.stacked_line_chart_rounded,
                          size: getProportionateScreenWidth(20),
                        ),
                        Text(
                          "4",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButtonNoIcon(
                  text: " Explore ",
                  press: () => Navigator.pushNamed(
                      context, CourseDetailScreen.routeName),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
