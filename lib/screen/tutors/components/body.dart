import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:one_on_one_learning/components/outlined_button_no_icon.dart';
import 'package:one_on_one_learning/components/search_bar.dart';

import 'tutor_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        const SearchBar(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      OutlinedButtonNoIcon(text: "English", press: () {}),
                      OutlinedButtonNoIcon(text: "Vietnamese", press: () {}),
                      OutlinedButtonNoIcon(text: "Italian", press: () {}),
                      OutlinedButtonNoIcon(text: "German", press: () {}),
                      OutlinedButtonNoIcon(text: "Spanish", press: () {}),
                      OutlinedButtonNoIcon(text: "Danish", press: () {}),
                      OutlinedButtonNoIcon(text: "Abric", press: () {}),
                      OutlinedButtonNoIcon(text: "Cambodian", press: () {}),
                    ],
                  ),
                ),
                const TutorCard(),
                const TutorCard(),
                const TutorCard(),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
