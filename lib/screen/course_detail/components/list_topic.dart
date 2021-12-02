import 'package:flutter/material.dart';
import 'package:one_on_one_learning/screen/course_detail/components/topic_card.dart';

class ListTopic extends StatelessWidget {
  const ListTopic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
