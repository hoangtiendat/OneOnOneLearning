import 'package:flutter/material.dart';
import 'package:one_on_one_learning/components/outlined_button_icon.dart';
import 'package:one_on_one_learning/components/outlined_button_no_icon.dart';
import 'package:one_on_one_learning/components/title_blue_bold.dart';
import 'package:one_on_one_learning/models/tutor.dart';
import 'package:one_on_one_learning/screens/booking/booking_screen.dart';
import 'package:one_on_one_learning/screens/course/components/course_card.dart';
import 'package:one_on_one_learning/screens/tutor_detail/components/rating_comment_card.dart';
import 'package:provider/provider.dart';

import '../../../size_config.dart';
import 'action_count.dart';
import 'info_tutor.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tutor = Provider.of<TutorProvider>(context, listen: true).tutorCurr;
    return SafeArea(
      child: tutor == null
          ? const Center(
              child: Text(
                'No data.',
                style: TextStyle(fontSize: 20),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 28,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        InfoTutor(
                          tutor: tutor,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButtonIcon(
                            text: " Booking ",
                            icon: const Icon(Icons.bookmark_add),
                            press: () {
                              Navigator.pushNamed(
                                  context, BookingScreen.routeName);
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            ActionCount(
                              icon: Icons.message,
                              text: "Message",
                            ),
                            ActionCount(
                              icon: Icons.report,
                              text: "Report",
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          "I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, reading and watching podcasts on Youtube. My most memorable life experience would be living in and traveling around Southeast Asia.",
                          maxLines: 3,
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(18),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(getProportionateScreenWidth(18)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TitleBlueBold(
                            text: "Languages",
                          ),
                          Wrap(
                            children: [
                              OutlinedButtonNoIcon(
                                text: "English",
                                press: () {},
                              ),
                            ],
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          const TitleBlueBold(
                            text: "Interests",
                          ),
                          Text(
                            "I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, reading and watching podcasts on Youtube. My most memorable life experience would be living in and traveling around Southeast Asia.",
                            maxLines: 3,
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(16)),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          const TitleBlueBold(
                            text: "Teaching experience",
                          ),
                          Text(
                            "I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, reading and watching podcasts on Youtube. My most memorable life experience would be living in and traveling around Southeast Asia.",
                            maxLines: 3,
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(16)),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          const TitleBlueBold(
                            text: "Specialties",
                          ),
                          Wrap(
                            children: [
                              OutlinedButtonNoIcon(
                                text: "English for Business",
                                press: () {},
                              ),
                              OutlinedButtonNoIcon(
                                text: "Conversational",
                                press: () {},
                              ),
                              OutlinedButtonNoIcon(
                                text: "English for kids",
                                press: () {},
                              ),
                            ],
                          ),
                          const TitleBlueBold(
                            text: "Course",
                          ),
                          // SingleChildScrollView(
                          //   scrollDirection: Axis.horizontal,
                          //   child: Row(
                          //     children: const [
                          //       CourseCard(),
                          //       CourseCard(),
                          //       CourseCard(),
                          //     ],
                          //   ),
                          // ),
                          SizedBox(
                            height: getProportionateScreenHeight(380),
                            child: tutor.courses.isEmpty
                                ? const Center(
                                    child: Text(
                                      'No tutors.',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  )
                                : ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: tutor.courses.length,
                                    itemBuilder: (context, index) => SizedBox(
                                      width: 300,
                                      child: CourseCard(
                                        course: tutor.courses[index],
                                        isPop: true,
                                      ),
                                    ),
                                  ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          const TitleBlueBold(
                            text: "Rating and Comment (4)",
                          ),
                          SizedBox(
                            child: Column(
                              children: const [
                                RatingCommentCard(),
                                RatingCommentCard(),
                                RatingCommentCard(),
                                RatingCommentCard(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                ],
              ),
            ),
    );
  }
}
