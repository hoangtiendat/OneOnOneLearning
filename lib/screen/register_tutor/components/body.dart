import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:one_on_one_learning/components/default_button.dart';
import 'package:one_on_one_learning/screen/profile/components/profile_form.dart';
import 'package:one_on_one_learning/screen/profile/components/profile_pic.dart';
import 'package:one_on_one_learning/screen/register_tutor/components/country_select.dart';
import 'package:one_on_one_learning/screen/setting/setting_screen.dart';
import 'package:one_on_one_learning/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {"text": "Complete profile"},
    {"text": "Video introduction"},
    {"text": "Approval"},
  ];

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  splashData.length, (index) => buildDot(index: index)),
            ),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) =>
                    RegisterTutorStep(index: index),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(getProportionateScreenWidth(20)),
              child: DefaultButton(
                text: currentPage == 2 ? "Complete" : "Continue",
                press: () {
                  currentPage == 2
                      ? Navigator.pushNamed(context, SettingScreen.routeName)
                      : setState(() {
                          currentPage = currentPage + 1;
                          pageController.animateToPage(currentPage,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.ease);
                        });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(
        right: 5,
      ),
      height: getProportionateScreenWidth(40),
      width: currentPage == index
          ? getProportionateScreenWidth(150)
          : SizeConfig.screenWidth! * 0.1,
      child: TextButton(
        style: TextButton.styleFrom(
          shadowColor: Colors.grey,
          elevation: 5,
          primary: Colors.blue,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(50)),
            side: const BorderSide(color: Colors.blue),
          ),
        ),
        onPressed: () {},
        child: Text(
          currentPage == index
              ? splashData[index]["text"]!
              : (index + 1).toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(15),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class RegisterTutorStep extends StatelessWidget {
  const RegisterTutorStep({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: const [
              ProfilePic(),
              SizedBox(height: 20),
              CountrySelect(),
              BirthDay(),
              TagLine(name: 'Curriculum Vitae'),
            ],
          ),
        ),
      );
    } else if (index == 1) {
      return Icon(
        Icons.smart_display_rounded,
        size: getProportionateScreenHeight(200),
      );
    } else {
      return Column(
        children: [
          SizedBox(height: getProportionateScreenWidth(30)),
          Icon(
            Icons.sentiment_satisfied_alt_outlined,
            size: getProportionateScreenWidth(100),
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          Text(
            "You have done all the steps",
            style: TextStyle(
              fontSize: getProportionateScreenHeight(30),
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          Text(
            "Please, wait for the operator's approval.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: getProportionateScreenHeight(30),
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    }
  }
}

class TagLine extends StatelessWidget {
  final String name;
  const TagLine({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        children: [
          const Expanded(
            flex: 1,
            child: Divider(
              height: 10,
              indent: 0,
              endIndent: 5,
              thickness: 2,
              color: Colors.grey,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(name,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
          ),
          const Expanded(
            flex: 1,
            child: Divider(
              height: 10,
              indent: 5,
              endIndent: 0,
              thickness: 2,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class BirthDay extends StatefulWidget {
  const BirthDay({Key? key}) : super(key: key);

  @override
  _BirthDayState createState() => _BirthDayState();
}

class _BirthDayState extends State<BirthDay> {
  var _date = DateTime.now();
  // ignore: prefer_void_to_null
  Future<Null> _selecDate(BuildContext context) async {
    DateTime? _datePicer = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1800),
      lastDate: DateTime(2100),
      helpText: 'Birthday',
    );

    if (_datePicer != null && _datePicer != _date) {
      setState(() {
        _date = _datePicer;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var format = DateFormat('dd-MM-yyyy').format(_date);
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Birth Of Day',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 10),
          Container(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey.shade50,
                elevation: 0,
                alignment: Alignment.centerLeft,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(color: Colors.grey),
                ),
              ),
              onPressed: () {
                setState(() {
                  _selecDate(context);
                });
              },
              child: Text(
                format,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
