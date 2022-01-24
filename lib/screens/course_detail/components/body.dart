import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:one_on_one_learning/provider/courses.dart';
import 'package:one_on_one_learning/screens/course_detail/components/text_bold.dart';
import 'package:one_on_one_learning/screens/course_detail/components/topic_expand.dart';
import 'package:provider/provider.dart';
import 'detail_course.dart';

import '../../../utility/size_config.dart';

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
        Provider.of<CourseProvider>(context, listen: true).currentCourses;
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
                    // Image(
                    //   image: AssetImage(course.imageUrl!),
                    //   fit: BoxFit.cover,
                    //   height: getProportionateScreenWidth(150),
                    //   width: double.infinity,
                    // ),
                    SizedBox(
                      width: double.infinity,
                      height: getProportionateScreenWidth(150),
                      child: CachedNetworkImage(
                        imageUrl: course.imageUrl!,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            // borderRadius: const BorderRadius.only(
                            //   topLeft: Radius.circular(10),
                            //   topRight: Radius.circular(10),
                            // ),
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
                            course.name!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                DetailCourse(
                  course: course,
                ),
                TopicExpand(
                  topics: course.topics!,
                ),
              ]),
            ),
    );
  }
}
