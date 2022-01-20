import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:one_on_one_learning/components/image_net.dart';
import 'package:one_on_one_learning/models/tutor/tutor.dart';
import 'package:one_on_one_learning/provider/tutor.dart';
import 'package:provider/provider.dart';

import '../../../size_config.dart';

class InfoTutor extends StatefulWidget {
  const InfoTutor({
    Key? key,
    required this.tutor,
  }) : super(key: key);
  final Tutor tutor;

  @override
  State<InfoTutor> createState() => _InfoTutorState();
}

class _InfoTutorState extends State<InfoTutor> {
  late bool favorite;
  @override
  void initState() {
    favorite = widget.tutor.isFavorite!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageNet(
          urlAvatar: widget.tutor.user!.avatar!,
          size: getProportionateScreenWidth(70),
        ),
        // SizedBox(
        //   height: getProportionateScreenWidth(70),
        //   width: getProportionateScreenWidth(70),
        //   child: CircleAvatar(
        //     backgroundImage: NetworkImage(tutor.user!.avatar!),
        //   ),
        // ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.tutor.user!.name!,
                style: TextStyle(fontSize: getProportionateScreenWidth(25)),
                textAlign: TextAlign.left,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RatingBar.builder(
                    initialRating: widget.tutor.avgRating!,
                    itemSize: 18,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    ignoreGestures: true,
                    onRatingUpdate: (rating) {},
                  ),
                  GestureDetector(
                    onTap: () async {
                      await Provider.of<TutorProvider>(context, listen: false)
                          .manageFavoriteTutor(widget.tutor.userId!);
                      setState(() {
                        favorite = !favorite;
                      });
                      var snackBar = SnackBar(
                        content: Text(
                          favorite
                              ? 'Favorite ' + widget.tutor.user!.name!
                              : 'Unfavorite ' + widget.tutor.user!.name!,
                        ),
                      );
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Icon(
                      favorite ? Icons.favorite : Icons.favorite_border,
                      color: favorite ? Colors.red : Colors.blue,
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
