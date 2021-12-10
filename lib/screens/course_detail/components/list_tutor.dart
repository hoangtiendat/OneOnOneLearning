import 'package:flutter/material.dart';
import 'package:one_on_one_learning/models/tutor.dart';
import 'package:one_on_one_learning/screens/tutors/components/tutor_card.dart';

class ListTutor extends StatelessWidget {
  const ListTutor({
    Key? key,
    required this.tutors,
  }) : super(key: key);
  final List<Tutor> tutors;

  @override
  Widget build(BuildContext context) {
    return tutors.isEmpty
        ? const Center(
            child: Text(
              'No tutors.',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: tutors.length,
            itemBuilder: (context, index) => TutorCard(
              tutor: tutors[index],
              isPop: true,
            ),
          );
  }
}
