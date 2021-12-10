import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:one_on_one_learning/models/tutor.dart';
import 'package:provider/provider.dart';

import '../../../size_config.dart';

class InfoTutor extends StatelessWidget {
  const InfoTutor({
    Key? key,
    required this.tutor,
  }) : super(key: key);
  final Tutor tutor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: getProportionateScreenWidth(70),
          width: getProportionateScreenWidth(70),
          child: CircleAvatar(
            backgroundImage: AssetImage(tutor.avatar),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tutor.name,
                style: TextStyle(fontSize: getProportionateScreenWidth(25)),
                textAlign: TextAlign.left,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RatingBar.builder(
                    initialRating: 3,
                    itemSize: 18,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                  GestureDetector(
                    onTap: () {
                      Provider.of<TutorProvider>(context, listen: false)
                          .isFavorite(tutor.id);
                      var snackBar = SnackBar(
                        content: Text(
                          tutor.isFavorite
                              ? 'Favorite ' + tutor.name
                              : 'Unfavorite ' + tutor.name,
                        ),
                      );
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Icon(
                      tutor.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: tutor.isFavorite ? Colors.red : Colors.blue,
                      semanticLabel: 'Remove from saved',
                    ),
                  ),
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
