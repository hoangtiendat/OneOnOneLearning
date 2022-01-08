import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:one_on_one_learning/components/image_net.dart';
import 'package:one_on_one_learning/constants.dart';
import 'package:one_on_one_learning/models/feedback.dart';

import '../../../size_config.dart';

class RatingCommentCard extends StatelessWidget {
  const RatingCommentCard({
    Key? key,
    required this.feedbacks,
  }) : super(key: key);
  final Feedbacks feedbacks;

  @override
  Widget build(BuildContext context) {
    DateTime parseDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(feedbacks.updatedAt!);
    var outputDate = DateFormat('MM/dd/yyyy hh:mm a').format(parseDate);
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
                  ImageNet(
                    urlAvatar: feedbacks.firstInfo!.avatar!,
                    size: getProportionateScreenWidth(50),
                  ),
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(50),
                  //   child: Image(
                  //     image:
                  //         const AssetImage("assets/images/avatar/avatar6.jpg"),
                  //     fit: BoxFit.cover,
                  //     width: getProportionateScreenWidth(60),
                  //     height: getProportionateScreenWidth(60),
                  //   ),
                  // ),
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
                              feedbacks.firstInfo!.name!,
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(20),
                                  fontWeight: FontWeight.bold,
                                  color: kTextColor),
                            ),
                            RatingBar.builder(
                              initialRating:
                                  double.parse(feedbacks.rating!.toString()),
                              itemSize: 15,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              ignoreGestures: true,
                              onRatingUpdate: (rating) {},
                            ),
                          ],
                        ),
                        Text(
                          feedbacks.content!,
                          style: TextStyle(
                            color: kTextColor,
                            fontSize: getProportionateScreenWidth(18),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  outputDate,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: getProportionateScreenWidth(15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
