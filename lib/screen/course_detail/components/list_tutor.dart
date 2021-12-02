import 'package:flutter/material.dart';
import 'package:one_on_one_learning/screen/course_detail/components/topic_card.dart';

class ListTutor extends StatelessWidget {
  const ListTutor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TopicCard(
          topic: "1",
          title: "Tutor 1",
        ),
        TopicCard(
          topic: "2",
          title: "Tutor 2",
        ),
      ],
    );
  }
}
