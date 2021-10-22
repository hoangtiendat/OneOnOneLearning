import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../size_config.dart';

class InfoTutor extends StatelessWidget {
  const InfoTutor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: getProportionateScreenWidth(70),
          width: getProportionateScreenWidth(70),
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
                "https://dev.api.lettutor.com/avatar/3b994227-2695-44d4-b7ff-333b090a45d4avatar1632047402615.jpg"),
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
                  Text(
                    "April Corpuz",
                    style: TextStyle(fontSize: getProportionateScreenWidth(25)),
                    textAlign: TextAlign.left,
                  ),
                  RatingBar.builder(
                    initialRating: 3,
                    itemSize: 18,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Teacher",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(20),
                        color: Colors.grey),
                  ),
                  const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                ],
              ),
              Text(
                "Vietnamese",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(20),
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(5),
              ),
            ],
          ),
        )
      ],
    );
  }
}
