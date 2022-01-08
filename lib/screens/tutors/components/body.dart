import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:one_on_one_learning/components/outlined_button_no_icon_v2.dart';
import 'package:one_on_one_learning/components/search_bar.dart';
import 'package:one_on_one_learning/models/category.dart';
import 'package:one_on_one_learning/models/rows.dart';
import 'package:one_on_one_learning/models/tutor/tutor.dart';

import '../../../size_config.dart';
import 'tutor_card.dart';

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
  String idCategory = "0";
  bool favoriteList = false;

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
    List<Rows> tutors = [];
    // List<Tutor> tutors = Provider.of<TutorProvider>(context, listen: true)
    //     .search(_terms, idCategory, favoriteList);
    List<CategoryObj> categories = CategoryModel.categories;
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SearchBar(
                  controller: _controller,
                  focusNode: _focusNode,
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(80),
                height: getProportionateScreenWidth(80),
                child: IconButton(
                  icon: Icon(
                    favoriteList ? Icons.favorite : Icons.favorite_border,
                    size: getProportionateScreenWidth(50),
                    color: favoriteList ? Colors.red : Colors.blue,
                  ),
                  onPressed: () {
                    setState(() {
                      favoriteList = !favoriteList;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: getProportionateScreenWidth(45),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) => OutlinedButtonNoIconV2(
                text: categories[index].englishName,
                press: () {
                  setState(() {
                    indexSelected = index;
                    idCategory = categories[index].id;
                  });
                },
                isSelected: index == indexSelected,
              ),
            ),
          ),
          Expanded(
            child: tutors.isEmpty
                ? const Center(
                    child: Text(
                      'No tutors.',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: tutors.length,
                    itemBuilder: (context, index) => TutorCard(
                      tutor: tutors[index],
                      isPop: false,
                    ),
                  ),
            // child: FutureBuilder<Tutors>(
            //   initialData:
            //       Provider.of<TutorProvider>(context, listen: false).tutors,
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       return ListView.builder(
            //         physics: const NeverScrollableScrollPhysics(),
            //         shrinkWrap: true,
            //         itemCount: snapshot.data!.count,
            //         itemBuilder: (context, index) => TutorCard(
            //           tutor: snapshot.data!.rows[index],
            //           isPop: false,
            //         ),
            //       );
            //     } else if (snapshot.hasError) {
            //       return Text('${snapshot.error}');
            //     }
            //     return const CircularProgressIndicator();
            //   },
            // ),
          ),
        ],
      ),
    );
  }
}
