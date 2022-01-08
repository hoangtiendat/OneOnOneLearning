import 'package:flutter/material.dart';
import 'package:one_on_one_learning/components/search_bar.dart';
import 'package:one_on_one_learning/models/category.dart';
import 'package:one_on_one_learning/models/courses.dart';
import 'package:one_on_one_learning/screens/course/components/course_card.dart';
import 'package:one_on_one_learning/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  String _terms = "";
  int indexSelected = 0;
  String level = 'Any Level';
  // CategoryObj category = CategoryModel.categories[0];
  String category = "0";

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()..addListener(_onTextChanged);
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _terms = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Course> courses = [];
    // Provider.of<CourseProvider>(context, listen: true).search(
    //   _terms,
    //   category,
    //   level,
    // );
    List<CategoryObj> categories = CategoryModel.categories;
    return SafeArea(
      child: Column(
        children: [
          SearchBar(
            controller: _controller,
            focusNode: _focusNode,
          ),
          // Card(
          //   shape: const StadiumBorder(
          //     side: BorderSide(
          //       color: Colors.black,
          //       width: 1,
          //     ),
          //   ),
          //   child: ListTile(
          //     title: const Text("Category"),
          //     trailing: const Icon(Icons.keyboard_arrow_down_outlined),
          //     onTap: () {
          //       showModalBottomSheet(
          //         context: context,
          //         builder: (context) {
          //           return SizedBox(
          //             child: Wrap(
          //               alignment: WrapAlignment.center,
          //               children: categories
          //                   .map(
          //                     (item) => OutlinedButtonNoIcon(
          //                       text: item.englishName,
          //                       press: () {},
          //                     ),
          //                   )
          //                   .toList()
          //                   .cast<Widget>(),
          //             ),
          //           );
          //         },
          //       );
          //     },
          //   ),
          // ),
          SizedBox(
            width: SizeConfig.screenWidth! * 0.8,
            child: DropdownButton<String>(
              value: category,
              icon: const Icon(Icons.keyboard_arrow_down_rounded),
              iconSize: 24,
              elevation: 16,
              isExpanded: true,
              onChanged: (String? newValue) {
                setState(() {
                  category = newValue!;
                });
              },
              items:
                  categories.map<DropdownMenuItem<String>>((CategoryObj value) {
                return DropdownMenuItem<String>(
                  value: value.id,
                  child: Text(value.englishName),
                );
              }).toList(),
            ),
          ),
          SizedBox(
            width: SizeConfig.screenWidth! * 0.8,
            child: DropdownButton<String>(
              value: level,
              icon: const Icon(Icons.keyboard_arrow_down_rounded),
              iconSize: 24,
              elevation: 16,
              isExpanded: true,
              onChanged: (String? newValue) {
                setState(() {
                  level = newValue!;
                });
              },
              items: <String>[
                'Any Level',
                'Beginner',
                'Intermediate',
                'Advanced'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: courses.isEmpty
                ? const Center(
                    child: Text(
                      'No tutors.',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: courses.length,
                    itemBuilder: (context, index) => CourseCard(
                      course: courses[index],
                      isPop: false,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
