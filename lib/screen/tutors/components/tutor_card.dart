import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:one_on_one_learning/components/outlined_button_icon.dart';
import 'package:one_on_one_learning/components/outlined_button_no_icon.dart';
import 'package:one_on_one_learning/screen/tutor_detail/tutor_detail.dart';

import '../../../size_config.dart';

class TutorCard extends StatelessWidget {
  const TutorCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: DecoratedBox(
        decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                  const SizedBox(width: 8,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () => Navigator.popAndPushNamed(context, TutorDetailScreen.routeName),
                                  child: Text(
                                    "My name",
                                    style: TextStyle(fontSize: getProportionateScreenWidth(20)),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                RatingBar.builder(
                                  initialRating: 3,
                                  itemSize: 20.0,
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {},
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: (){},
                              child: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                                semanticLabel: 'Remove from saved',
                              ),
                            ),
                          ],
                        ),
                        
                        Wrap(
                          children: [
                            OutlinedButtonNoIcon(text: "English", press: () {}),
                            OutlinedButtonNoIcon(text: "Vietnamese", press: () {}),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
             const SizedBox(
               child: Expanded(
                  child: Text(
                    "I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, reading and watching podcasts on Youtube. My most memorable life experience would be living in and traveling around Southeast Asia.",
                    maxLines: 3,
                  ),
                ),
             ),
             const SizedBox(height: 8,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                  OutlinedButtonIcon(
                    text: "Book",
                    icon: const Icon(Icons.bookmark_add),
                    press: () {},
                  ),
                  OutlinedButtonIcon(
                    text: "Message",
                    icon: const Icon(Icons.message_outlined),
                    press: () {},
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
