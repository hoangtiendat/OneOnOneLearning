import 'package:flutter/material.dart';
import 'package:one_on_one_learning/models/tutor.dart';
import 'package:one_on_one_learning/screen/tutors/components/tutor_card.dart';
import 'package:one_on_one_learning/screen/tutors/tutors_screen.dart';
import 'package:provider/provider.dart';

import '../../../size_config.dart';
import 'home_banner.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Tutor> tutors =
        Provider.of<TutorProvider>(context, listen: true).search("", "0");
    return SafeArea(
      child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            const HomeBanner(),
            Padding(
              padding: EdgeInsets.all(
                getProportionateScreenWidth(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommended Tutors",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(20),
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.popAndPushNamed(
                          context, TutorsScreen.routeName);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          "See More",
                          style: TextStyle(color: Colors.blue),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.blue,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            tutors.isEmpty
                ? const Center(
                    child: Text(
                      'No tutors.',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                : ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) => TutorCard(
                      tutor: tutors[index],
                      isPop: false,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
