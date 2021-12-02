import 'package:flutter/material.dart';
import 'package:one_on_one_learning/constants.dart';
import 'package:one_on_one_learning/size_config.dart';

import 'text_bold.dart';

class InfoCourse extends StatelessWidget {
  const InfoCourse({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth! * 0.6,
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
          padding: EdgeInsets.all(getProportionateScreenWidth(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: const [
                  TextBold(
                    text: "10",
                    color: kPrimaryColor,
                  ),
                  TextBold(
                    text: "topics",
                    color: kPrimaryColor,
                  ),
                ],
              ),
              Column(
                children: const [
                  TextBold(
                    text: "1",
                  ),
                  TextBold(
                    text: "tutors",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    // return SizedBox(
    //   height: getProportionateScreenHeight(60),
    //   width: SizeConfig.screenWidth!,
    //   child: Stack(
    //     fit: StackFit.expand,
    //     clipBehavior: Clip.none,
    //     children: [
    //       Positioned(
    //         top: 0,
    //         left: SizeConfig.screenWidth! * 0.2,
    //         child: SizedBox(
    //           width: SizeConfig.screenWidth! * 0.6,
    //           child: DecoratedBox(
    //             decoration: BoxDecoration(
    //               color: Colors.white,
    //               borderRadius: const BorderRadius.only(
    //                   topLeft: Radius.circular(10),
    //                   topRight: Radius.circular(10),
    //                   bottomLeft: Radius.circular(10),
    //                   bottomRight: Radius.circular(10)),
    //               boxShadow: [
    //                 BoxShadow(
    //                   color: Colors.grey.withOpacity(0.5),
    //                   spreadRadius: 5,
    //                   blurRadius: 7,
    //                   offset: const Offset(0, 3), // changes position of shadow
    //                 ),
    //               ],
    //             ),
    //             child: Padding(
    //               padding: EdgeInsets.all(getProportionateScreenWidth(8)),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                 children: [
    //                   Column(
    //                     children: const [
    //                       TextBold(
    //                         text: "10",
    //                         color: kPrimaryColor,
    //                       ),
    //                       TextBold(
    //                         text: "topics",
    //                         color: kPrimaryColor,
    //                       ),
    //                     ],
    //                   ),
    //                   Column(
    //                     children: const [
    //                       TextBold(
    //                         text: "1",
    //                       ),
    //                       TextBold(
    //                         text: "tutors",
    //                       ),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
