import 'package:flutter/material.dart';
import 'package:one_on_one_learning/components/country_select.dart';
import 'package:one_on_one_learning/components/radio_level.dart';
import 'package:one_on_one_learning/components/select_language.dart';
import 'package:one_on_one_learning/components/tag_line.dart';
import 'package:one_on_one_learning/screens/profile/components/profile_pic.dart';

import '../../../utility/size_config.dart';

class RegisterTutorStep extends StatelessWidget {
  const RegisterTutorStep({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    // List<CategoryObj> categories = CategoryModel.categories;
    if (index == 0) {
      return SingleChildScrollView(
        physics: const ScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: const [
              ProfilePic(avatar: ""),
              SizedBox(height: 20),
              CountrySelect(),
              // SelectDate(),
              TagLine(name: 'Curriculum Vitae'),
              SelectLanguage(),
              RadioLevel(),
              // const Text(
              //   'My specialties are',
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              // ),
              // ListView.builder(
              //   physics: const NeverScrollableScrollPhysics(),
              //   shrinkWrap: true,
              //   itemCount: categories.length,
              //   itemBuilder: (context, index) => LabeledCheckbox(
              //     label: categories[index].englishName,
              //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
              //     value: true,
              //     onChanged: (bool newValue) {},
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else if (index == 1) {
      return SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'A few helpful tips:',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      '1. Find a clean and quiet space',
                      style: TextStyle(fontSize: 15.5),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      '2. Smile and look at the camera',
                      style: TextStyle(fontSize: 15.5),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      '3. Dress smart',
                      style: TextStyle(fontSize: 15.5),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      '4. Speak for 1-3 minutes',
                      style: TextStyle(fontSize: 15.5),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      '5. Brand yourself and have fun!',
                      style: TextStyle(fontSize: 15.5),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(0),
                child: ElevatedButton(
                  child: const Text('Choose video',
                      style: TextStyle(color: Colors.blue, fontSize: 16)),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.only(
                        left: 40, right: 40, top: 10, bottom: 10),
                    primary: Colors.grey.shade50,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    side: const BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              Container(
                height: 300,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 20),
                child: const Image(
                  image: AssetImage(
                    "assets/images/avatar/avatar6.jpg",
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Column(
        children: [
          SizedBox(height: getProportionateScreenWidth(30)),
          Icon(
            Icons.check_circle_outline_outlined,
            size: getProportionateScreenWidth(100),
            color: Colors.blue,
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          Text(
            "You have done all the steps",
            style: TextStyle(
              fontSize: getProportionateScreenHeight(30),
            ),
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          Text(
            "Please, wait for the operator's approval.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: getProportionateScreenHeight(30),
            ),
          ),
        ],
      );
    }
  }
}
