import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:one_on_one_learning/components/title_blue_bold.dart';
import 'package:provider/provider.dart';

import '../../../theme.dart';

class DisplayScreen extends StatefulWidget {
  const DisplayScreen({Key? key}) : super(key: key);

  @override
  State<DisplayScreen> createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  var _tabTextIndexSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleBlueBold(
                text: "Theme",
              ),
              Center(
                child: FlutterToggleTab(
                  height: 40,
                  width: 50,
                  borderRadius: 15,
                  selectedIndex: _tabTextIndexSelected,
                  selectedTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                  unSelectedTextStyle: const TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                  labels: const [
                    "Light",
                    "Dark",
                  ],
                  // icons: const [Icons.topic_sharp, Icons.people_alt_outlined],
                  selectedLabelIndex: (index) {
                    setState(() {
                      _tabTextIndexSelected = index;
                    });
                    Provider.of<ThemeChanger>(context, listen: false).setTheme(
                        index == 0 ? ThemeData.light() : ThemeData.dark());
                  },
                  isScroll: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
