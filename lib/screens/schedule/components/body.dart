import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:one_on_one_learning/models/schedule/schedule.dart';
import 'package:one_on_one_learning/models/schedule/schedules.dart';
import 'package:one_on_one_learning/provider/schedule.dart';
import 'package:one_on_one_learning/screens/schedule/components/schedule_tag.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late String strDate = "";
  static const _pageSize = 20;
  final PagingController<int, Schedule> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final parameters = {
        "page": pageKey.toString(),
        "perPage": _pageSize.toString(),
        "dateTimeGte": DateTime.now().millisecondsSinceEpoch.toString(),
        "orderBy": "meeting",
        "sortBy": "asc"
      };
      final newItems = await ScheduleProvider().fetchSchedules(parameters);
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
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PagedListView<int, Schedule>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Schedule>(
          itemBuilder: (context, item, index) => ScheduleTag(
            schedule: item,
          ),
        ),
      ),
      // child: SingleChildScrollView(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       FutureBuilder<Schedules>(
      //         future: futureSchedules,
      //         builder: (context, snapshot) {
      //           if (snapshot.hasData) {
      //             return ListView.builder(
      //               physics: const NeverScrollableScrollPhysics(),
      //               shrinkWrap: true,
      //               itemCount: snapshot.data!.rows!.length,
      //               itemBuilder: (context, index) => ScheduleTag(
      //                 schedule: snapshot.data!.rows![index],
      //               ),
      //             );
      //           } else if (snapshot.hasError) {
      //             return Text('${snapshot.error}');
      //           }
      //           return const Center(child: CircularProgressIndicator());
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
