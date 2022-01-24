import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:one_on_one_learning/components/search_bar.dart';
import 'package:one_on_one_learning/models/course/categoryobj.dart';
import 'package:one_on_one_learning/models/course/courses.dart';
import 'package:one_on_one_learning/provider/schedule.dart';
import 'package:one_on_one_learning/screens/course/components/course_card.dart';
import 'package:one_on_one_learning/utility/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  String _terms = "";

  String level = 'Any Level';
  // CategoryObj category = CategoryModel.categories[0];
  String category = "0";
  static const _pageSize = 20;
  late PagingController<int, Courses> _pagingController;

  @override
  void initState() {
    _pagingController = PagingController(firstPageKey: 1);
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
    _controller = TextEditingController()..addListener(_onTextChanged);
    _focusNode = FocusNode();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final parameters = {
        "page": pageKey.toString(),
        "size": _pageSize.toString(),
        "q": _terms
        // "dateTimeGte": DateTime.now().millisecondsSinceEpoch.toString(),
        // "orderBy": "meeting",
        // "sortBy": "asc"
      };
      final newItems = await ScheduleProvider().fetchCourses(parameters);
      final isLastPage = newItems!.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  void _onTextChanged() {
    setState(() {
      _terms = _controller.text;
    });
    _pagingController.refresh();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            // child: courses.isEmpty
            //     ? const Center(
            //         child: Text(
            //           'No course.',
            //           style: TextStyle(fontSize: 20),
            //         ),
            //       )
            //     : ListView.builder(
            //         scrollDirection: Axis.vertical,
            //         itemCount: courses.length,
            //         itemBuilder: (context, index) => CourseCard(
            //           course: courses[index],
            //           isPop: false,
            //         ),
            //       ),
            child: PagedListView<int, Courses>(
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<Courses>(
                itemBuilder: (context, item, index) => CourseCard(
                  course: item,
                  isPop: false,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
