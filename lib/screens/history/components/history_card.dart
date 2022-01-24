import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:one_on_one_learning/components/image_net.dart';
import 'package:one_on_one_learning/utility/constants.dart';
import 'package:one_on_one_learning/models/schedule/schedule.dart';
import 'package:one_on_one_learning/screens/schedule/components/from_to_time.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../utility/size_config.dart';
import 'btn_history_card.dart';
import 'icon_text.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    Key? key,
    required this.schedule,
  }) : super(key: key);
  final Schedule schedule;

  @override
  Widget build(BuildContext context) {
    final f = DateFormat('dd/MM/yyyy');
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
                  ImageNet(
                      size: getProportionateScreenWidth(50),
                      urlAvatar: schedule.scheduleDetailInfo!.scheduleInfo!
                          .tutorInfo!.avatar!),
                  SizedBox(
                    width: getProportionateScreenWidth(15),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        schedule
                            .scheduleDetailInfo!.scheduleInfo!.tutorInfo!.name!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kTextColor,
                            fontSize: getProportionateScreenWidth(20)),
                      ),
                      SizedBox(
                        height: getProportionateScreenWidth(5),
                      ),
                      IconText(
                        icon: Icons.calendar_today_rounded,
                        text: f.format(DateTime.fromMillisecondsSinceEpoch(
                            schedule
                                .scheduleDetailInfo!.startPeriodTimestamp!)),
                      ),
                      SizedBox(
                        height: getProportionateScreenWidth(5),
                      ),
                      FromToTime(
                          startPeriod: schedule
                              .scheduleDetailInfo!.startPeriodTimestamp!,
                          endPeriod:
                              schedule.scheduleDetailInfo!.endPeriodTimestamp!),
                      SizedBox(
                        height: getProportionateScreenWidth(5),
                      ),
                      IconText(
                        icon: Icons.timer,
                        text: timeago.format(
                            DateTime.fromMillisecondsSinceEpoch(schedule
                                .scheduleDetailInfo!.endPeriodTimestamp!)),
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
