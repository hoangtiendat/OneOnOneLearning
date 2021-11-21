import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'from_to_time.dart';

class ScheduleTag extends StatelessWidget {
  const ScheduleTag({
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
                      const FromToTime(),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: getProportionateScreenWidth(15),
              ),
              SizedBox(
                height: getProportionateScreenHeight(35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: getProportionateScreenWidth(130),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.grey,
                          side: const BorderSide(color: Colors.grey),
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.all(0),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(15),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(130),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.white,
                          side: const BorderSide(color: Colors.grey),
                          backgroundColor: Colors.grey,
                          padding: const EdgeInsets.all(0),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Go to Meeting",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(15),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
