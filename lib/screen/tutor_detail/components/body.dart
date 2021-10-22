import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:one_on_one_learning/components/outlined_button_icon.dart';
import 'package:one_on_one_learning/components/outlined_button_no_icon.dart';
import 'package:one_on_one_learning/components/title_blue_bold.dart';
import 'package:one_on_one_learning/screen/booking/booking_screen.dart';

import '../../../size_config.dart';
import 'action_count.dart';
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
              width: 8,
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
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButtonNoIcon(
                  text: " Explore ",
                  press: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
