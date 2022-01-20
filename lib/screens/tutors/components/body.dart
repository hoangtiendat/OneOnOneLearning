import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:one_on_one_learning/components/outlined_button_no_icon_v2.dart';
import 'package:one_on_one_learning/components/search_bar.dart';
import 'package:one_on_one_learning/models/category.dart';
import 'package:one_on_one_learning/models/rows.dart';
import 'package:one_on_one_learning/provider/tutor.dart';

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
  static const _pageSize = 12;
  String codeCategory = "";
  bool favoriteList = false;
  late PagingController<int, Rows> _pagingController;

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
        "perPage": _pageSize.toString(),
        "filters": {
          "specialties": [codeCategory]
        },
        "search": _terms
        // "dateTimeGte": DateTime.now().millisecondsSinceEpoch.toString(),
        // "orderBy": "meeting",
        // "sortBy": "asc"
      };
      final newItems = await TutorProvider().searchTutors(parameters);
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

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    _pagingController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _terms = _controller.text;
    });
    _pagingController.refresh();
  }

  @override
  Widget build(BuildContext context) {
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
              // SizedBox(
              //   width: getProportionateScreenWidth(80),
              //   height: getProportionateScreenWidth(80),
              //   child: IconButton(
              //     icon: Icon(
              //       favoriteList ? Icons.favorite : Icons.favorite_border,
              //       size: getProportionateScreenWidth(50),
              //       color: favoriteList ? Colors.red : Colors.blue,
              //     ),
              //     onPressed: () {
              //       setState(() {
              //         favoriteList = !favoriteList;
              //       });
              //     },
              //   ),
              // ),
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
                    codeCategory = categories[index].key;
                  });
                  _pagingController.refresh();
                },
                isSelected: index == indexSelected,
              ),
            ),
          ),
          Expanded(
            // child: tutors.isEmpty
            //     ? const Center(
            //         child: Text(
            //           'No tutors.',
            //           style: TextStyle(fontSize: 20),
            //         ),
            //       )
            //     : ListView.builder(
            //         scrollDirection: Axis.vertical,
            //         itemCount: tutors.length,
            //         itemBuilder: (context, index) => TutorCard(
            //           tutor: tutors[index],
            //           isPop: false,
            //         ),
            //       ),
            child: PagedListView<int, Rows>(
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<Rows>(
                itemBuilder: (context, item, index) => TutorCard(
                  tutor: item,
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
