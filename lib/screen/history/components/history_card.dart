import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'btn_history_card.dart';
import 'icon_text.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenWidth(8),
          horizontal: getProportionateScreenWidth(16)),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(15)),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    height: getProportionateScreenWidth(50),
                    width: getProportionateScreenWidth(50),
                    child: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://dev.api.lettutor.com/avatar/3b994227-2695-44d4-b7ff-333b090a45d4avatar1632047402615.jpg"),
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(15),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kennag",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: getProportionateScreenWidth(20)),
                      ),
                      SizedBox(
                        height: getProportionateScreenWidth(5),
                      ),
                      const IconText(
                        icon: Icons.calendar_today_rounded,
                        text: "06:30:00 04/10/2021",
                      ),
                      SizedBox(
                        height: getProportionateScreenWidth(5),
                      ),
                      const IconText(
                        icon: Icons.timer,
                        text: "00:17:35",
                      ),
                      SizedBox(
                        height: getProportionateScreenWidth(5),
                      ),
                      const IconText(
                        icon: Icons.star_border_rounded,
                        text: "Not feedback yet",
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: getProportionateScreenWidth(15),
              ),
              const BtnHistoryCard()
            ],
          ),
        ),
      ),
    );
  }
}
