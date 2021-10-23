import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:one_on_one_learning/components/outlined_button_icon.dart';
import 'package:one_on_one_learning/components/outlined_button_no_icon.dart';
import 'package:one_on_one_learning/components/title_blue_bold.dart';

import '../../../size_config.dart';
import 'action_count.dart';
import 'courses/course_card.dart';
import 'info_tutor.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 28,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  const InfoTutor(),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButtonIcon(
                      text: " Booking ",
                      icon: const Icon(Icons.bookmark_add),
                      press: () {},
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
                        OutlinedButtonNoIcon(text: "English", press: () {}),
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
                      style:
                          TextStyle(fontSize: getProportionateScreenWidth(16)),
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
                      style:
                          TextStyle(fontSize: getProportionateScreenWidth(16)),
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
                            text: "English for Business", press: () {}),
                        OutlinedButtonNoIcon(
                            text: "Conversational", press: () {}),
                        OutlinedButtonNoIcon(
                            text: "English for kids", press: () {}),
                      ],
                    ),
                    const TitleBlueBold(
                      text: "Course",
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: const [
                          CourseCard(),
                          CourseCard(),
                          CourseCard(),
                        ],
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

class RatingCommentCard extends StatelessWidget {
  const RatingCommentCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 1,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      "https://dev.api.lettutor.com/avatar/3b994227-2695-44d4-b7ff-333b090a45d4avatar1632047402615.jpg",
                      fit: BoxFit.cover,
                      width: getProportionateScreenWidth(60),
                      height: getProportionateScreenWidth(60),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "April Corpuz",
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(20),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            RatingBar.builder(
                              initialRating: 3,
                              itemSize: 15,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {},
                            ),
                          ],
                        ),
                        const Text("She is great."),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "10:18:20 22/10/2021",
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
