import 'package:flutter/material.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
              child: Padding(
                padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
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
                              offset: const Offset(
                                  0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.all(getProportionateScreenWidth(15)),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Kennag",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                                getProportionateScreenWidth(
                                                    20)),
                                      ),
                                      SizedBox(
                                        height: getProportionateScreenWidth(5),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_today_rounded,
                                            size:
                                                getProportionateScreenWidth(20),
                                          ),
                                          SizedBox(
                                            width:
                                                getProportionateScreenWidth(10),
                                          ),
                                          Text(
                                            "06:30:00 04/10/2021",
                                            style: TextStyle(
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      15),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: getProportionateScreenWidth(5),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.timer,
                                            size:
                                                getProportionateScreenWidth(20),
                                          ),
                                          SizedBox(
                                            width:
                                                getProportionateScreenWidth(10),
                                          ),
                                          Text(
                                            "00:11:37",
                                            style: TextStyle(
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      15),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: getProportionateScreenWidth(5),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star_border_rounded,
                                            size:
                                                getProportionateScreenWidth(20),
                                          ),
                                          SizedBox(
                                            width:
                                                getProportionateScreenWidth(10),
                                          ),
                                          Text(
                                            "Not feedback yet",
                                            style: TextStyle(
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      15),
                                            ),
                                          ),
                                        ],
                                      ),
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
                                  children: [
                                    Expanded(
                                      child: OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          primary: Colors.white,
                                          side: const BorderSide(
                                              color: Colors.blue),
                                          backgroundColor: Colors.blue,
                                          padding: const EdgeInsets.all(0),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          "Give Feedback",
                                          style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(15),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: getProportionateScreenWidth(15),
                                    ),
                                    Expanded(
                                      child: OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          primary: Colors.blue,
                                          side: const BorderSide(
                                              color: Colors.blueAccent),
                                          backgroundColor: Colors.white,
                                          padding: const EdgeInsets.all(0),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          "Go to Meeting",
                                          style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(15),
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
                    ),
                    Padding(
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
                              offset: const Offset(
                                  0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.all(getProportionateScreenWidth(15)),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Kennag",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                                getProportionateScreenWidth(
                                                    20)),
                                      ),
                                      SizedBox(
                                        height: getProportionateScreenWidth(5),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_today_rounded,
                                            size:
                                                getProportionateScreenWidth(20),
                                          ),
                                          SizedBox(
                                            width:
                                                getProportionateScreenWidth(10),
                                          ),
                                          Text(
                                            "06:30:00 04/10/2021",
                                            style: TextStyle(
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      15),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: getProportionateScreenWidth(5),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.timer,
                                            size:
                                                getProportionateScreenWidth(20),
                                          ),
                                          SizedBox(
                                            width:
                                                getProportionateScreenWidth(10),
                                          ),
                                          Text(
                                            "00:11:37",
                                            style: TextStyle(
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      15),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: getProportionateScreenWidth(5),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star_border_rounded,
                                            size:
                                                getProportionateScreenWidth(20),
                                          ),
                                          SizedBox(
                                            width:
                                                getProportionateScreenWidth(10),
                                          ),
                                          Text(
                                            "Not feedback yet",
                                            style: TextStyle(
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      15),
                                            ),
                                          ),
                                        ],
                                      ),
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
                                  children: [
                                    Expanded(
                                      child: OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          primary: Colors.white,
                                          side: const BorderSide(
                                              color: Colors.blue),
                                          backgroundColor: Colors.blue,
                                          padding: const EdgeInsets.all(0),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          "Give Feedback",
                                          style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(15),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: getProportionateScreenWidth(15),
                                    ),
                                    Expanded(
                                      child: OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          primary: Colors.blue,
                                          side: const BorderSide(
                                              color: Colors.blueAccent),
                                          backgroundColor: Colors.white,
                                          padding: const EdgeInsets.all(0),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          "Go to Meeting",
                                          style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(15),
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
