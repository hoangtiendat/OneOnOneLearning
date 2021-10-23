import 'package:flutter/material.dart';
import 'package:one_on_one_learning/size_config.dart';

import 'text_bold.dart';
import 'topic_card.dart';

class DetailCourse extends StatelessWidget {
  const DetailCourse({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(15)),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextBold(
                text: "About Course",
                color: Colors.black,
              ),
              const Text("The English you need for your work and career."),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              const TextBold(
                text: "Overview",
                color: Colors.black,
              ),
              SizedBox(
                height: getProportionateScreenWidth(5),
              ),
              Row(
                children: const [
                  Icon(Icons.report_gmailerrorred),
                  Text(
                    "Why should you learn this course?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              const Text(
                  "Under starding business culture and customs is just as important as learning traditional business-related vocabulary. Under starding business culture and customs is just as important as learning traditional business-related vocabulary. Under starding business culture and customs is just as important as learning traditional business-related vocabulary."),
              SizedBox(
                height: getProportionateScreenWidth(5),
              ),
              Row(
                children: const [
                  Icon(Icons.report_gmailerrorred),
                  Text(
                    "What will you be able to do?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              const Text(
                  "Under starding business culture and customs is just as important as learning traditional business-related vocabulary. Under starding business culture and customs is just as important as learning traditional business-related vocabulary. Under starding business culture and customs is just as important as learning traditional business-related vocabulary."),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              const TextBold(
                text: "Level",
                color: Colors.black,
              ),
              Text(
                "4",
                style: TextStyle(fontSize: getProportionateScreenWidth(20)),
              ),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              const TextBold(
                text: "Topic",
                color: Colors.black,
              ),
              Column(
                children: const [
                  TopicCard(
                    topic: "1",
                    title: "Phone Conversation",
                  ),
                  TopicCard(
                    topic: "2",
                    title: "Mettings",
                  ),
                  TopicCard(
                    topic: "3",
                    title: "Negotiations",
                  ),
                  TopicCard(
                    topic: "4",
                    title: "Complains and Conflicts",
                  ),
                  TopicCard(
                    topic: "5",
                    title: "Job Interviews",
                  ),
                  TopicCard(
                    topic: "6",
                    title: "Scheduling and Time Management",
                  ),
                  TopicCard(
                    topic: "7",
                    title: "Presentations",
                  ),
                  TopicCard(
                    topic: "8",
                    title: "Work Styles",
                  ),
                  TopicCard(
                    topic: "9",
                    title: "Management and Leader",
                  ),
                  TopicCard(
                    topic: "10",
                    title: "Sales",
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
