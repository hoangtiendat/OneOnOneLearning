import 'package:flutter/material.dart';
import 'package:one_on_one_learning/components/outlined_button_icon.dart';
import 'package:one_on_one_learning/components/outlined_button_no_icon.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
            children: [
              const SizedBox(width: 8,),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Text(
                      "My name",
                      style: TextStyle(fontSize: getProportionateScreenWidth(40)),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 115,
                      width: 115,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage("https://dev.api.lettutor.com/avatar/3b994227-2695-44d4-b7ff-333b090a45d4avatar1632047402615.jpg"),
                      ),
                    ),
                    const SizedBox(height: 16,),
                    Text(
                      "I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, reading and watching podcasts on Youtube. My most memorable life experience would be living in and traveling around Southeast Asia.",
                      maxLines: 3,
                      style: TextStyle(fontSize: getProportionateScreenWidth(16)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  ActionCount(icon: Icons.star_border_outlined, text: "234 reviews",),
                  ActionCount(icon: Icons.favorite, text: "1,5k favorites",),
                  ActionCount(icon: Icons.book, text: "100 courses",),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: getProportionateScreenHeight(20),),
                      Text(
                        "Languages",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenWidth(18)
                        ),
                      ),
                      Wrap(
                        children: [
                          OutlinedButtonNoIcon(text: "English", press: () {}),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(20),),
                      Text(
                        "Specialties",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenWidth(18)
                        ),
                      ),
                      Wrap(
                        children: [
                          OutlinedButtonNoIcon(text: "English for Business", press: () {}),
                          OutlinedButtonNoIcon(text: "Conversational", press: () {}),
                          OutlinedButtonNoIcon(text: "English for kids", press: () {}),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(20),),
                      Text(
                        "Interests",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenWidth(18)
                        ),
                      ),
                      Text(
                        "I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, reading and watching podcasts on Youtube. My most memorable life experience would be living in and traveling around Southeast Asia.",
                        maxLines: 3,
                        style: TextStyle(fontSize: getProportionateScreenWidth(16)),
                      ),
                      SizedBox(height: getProportionateScreenHeight(20),),
                      Text(
                        "Teaching experience",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenWidth(18)
                        ),
                      ),
                      Text(
                        "I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, reading and watching podcasts on Youtube. My most memorable life experience would be living in and traveling around Southeast Asia.",
                        maxLines: 3,
                        style: TextStyle(fontSize: getProportionateScreenWidth(16)),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                  OutlinedButtonIcon(
                    text: "Book",
                    icon: const Icon(Icons.bookmark_add),
                    press: () {},
                  ),
                  OutlinedButtonIcon(
                    text: "Message",
                    icon: const Icon(Icons.message_outlined),
                    press: () {},
                  ),
               ],
             ),
             SizedBox(height: getProportionateScreenHeight(20),),
            ],
          ),
      ),
      );
  }
}

class ActionCount extends StatelessWidget {
  const ActionCount({
    Key? key, required this.icon, required this.text,
  }) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue, size: getProportionateScreenWidth(35),),
        Text(text, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: getProportionateScreenWidth(16)),),
      ],
    );
  }
}