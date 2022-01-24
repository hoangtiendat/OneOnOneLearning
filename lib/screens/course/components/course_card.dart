import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:one_on_one_learning/components/outlined_button_no_icon.dart';
import 'package:one_on_one_learning/models/course/courses.dart';
import 'package:one_on_one_learning/provider/courses.dart';
import 'package:one_on_one_learning/screens/course_detail/course_detail_screen.dart';
import 'package:provider/provider.dart';

import '../../../utility/size_config.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({Key? key, required this.course, required this.isPop})
      : super(key: key);
  final Courses course;
  final bool isPop;

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: getProportionateScreenWidth(150),
                child: CachedNetworkImage(
                  imageUrl: course.imageUrl!,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    color: Colors.grey,
                    size: getProportionateScreenWidth(150),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.name!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenWidth(20),
                        color: Colors.black,
                      ),
                      maxLines: 1,
                    ),
                    Text(
                      course.description!,
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
                          course.level!,
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
                    press: () async {
                      await Provider.of<CourseProvider>(context, listen: false)
                          .setCurrentId(course.id!);
                      if (isPop) {
                        Navigator.pop(context);
                      }
                      Navigator.pushNamed(
                        context,
                        CourseDetailScreen.routeName,
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
