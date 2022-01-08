import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:one_on_one_learning/components/image_net.dart';
import 'package:one_on_one_learning/components/outlined_button_icon.dart';
import 'package:one_on_one_learning/constants.dart';
import 'package:one_on_one_learning/models/rows.dart';
import 'package:one_on_one_learning/provider/tutor.dart';
import 'package:one_on_one_learning/screens/booking/booking_screen.dart';
import 'package:one_on_one_learning/screens/tutor_detail/tutor_detail.dart';
import 'package:provider/provider.dart';

import '../../../size_config.dart';

class TutorCard extends StatefulWidget {
  const TutorCard({
    Key? key,
    required this.tutor,
    required this.isPop,
  }) : super(key: key);

  final Rows tutor;
  final bool isPop;

  @override
  State<TutorCard> createState() => _TutorCardState();
}

class _TutorCardState extends State<TutorCard> {
  @override
  Widget build(BuildContext context) {
    TutorProvider tutorProvider = Provider.of<TutorProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
                  GestureDetector(
                    onTap: () async {
                      await tutorProvider.fetchTutor(widget.tutor.userId!);
                      if (widget.isPop) {
                        Navigator.pop(context);
                      }
                      Navigator.pushNamed(
                        context,
                        TutorDetailScreen.routeName,
                      );
                    },
                    child: ImageNet(
                      urlAvatar: widget.tutor.avatar!,
                      size: getProportionateScreenWidth(60),
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
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    await tutorProvider
                                        .fetchTutor(widget.tutor.userId!);
                                    if (widget.isPop) {
                                      Navigator.pop(context);
                                    }
                                    Navigator.pushNamed(
                                      context,
                                      TutorDetailScreen.routeName,
                                    );
                                  },
                                  child: Text(
                                    widget.tutor.name!,
                                    style: TextStyle(
                                      fontSize: getProportionateScreenWidth(20),
                                      color: kTextColor,
                                    ),
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
                              onTap: () async {
                                await tutorProvider
                                    .manageFavoriteTutor(widget.tutor.userId!);
                                var snackBar = SnackBar(
                                  content: Text(
                                    widget.tutor.isFavorite!
                                        ? 'Favorite ' + widget.tutor.name!
                                        : 'Unfavorite ' + widget.tutor.name!,
                                  ),
                                );
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              child: Icon(
                                widget.tutor.isFavorite!
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: widget.tutor.isFavorite!
                                    ? Colors.red
                                    : Colors.blue,
                                semanticLabel: 'Remove from saved',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getProportionateScreenWidth(40),
                          // child: ListView.builder(
                          //   scrollDirection: Axis.horizontal,
                          //   // shrinkWrap: true,
                          //   itemCount: widget.tutor.categories.length,
                          //   itemBuilder: (context, index) =>
                          //       OutlinedButtonNoIcon(
                          //     text: widget.tutor.categories[index].englishName,
                          //     press: () {},
                          //   ),
                          // ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                child: Text(
                  "I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, reading and watching podcasts on Youtube. My most memorable life experience would be living in and traveling around Southeast Asia.",
                  maxLines: 2,
                  style: TextStyle(
                      color: kTextColor,
                      fontSize: getProportionateScreenWidth(15)),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: getProportionateScreenWidth(150),
                    child: OutlinedButtonIcon(
                      text: "Book",
                      icon: const Icon(Icons.bookmark_add),
                      press: () =>
                          Navigator.pushNamed(context, BookingScreen.routeName),
                      //   Navigator.push(
                      // context,
                      // MaterialPageRoute(
                      //   builder: (context) => const BookingScreen(),
                      // ),
                      // ),
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(150),
                    child: OutlinedButtonIcon(
                      text: "Message",
                      icon: const Icon(Icons.message_outlined),
                      press: () {},
                    ),
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
