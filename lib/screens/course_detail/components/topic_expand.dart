import 'package:flutter/material.dart';
import 'package:one_on_one_learning/models/course/topic.dart';
import 'package:one_on_one_learning/screens/course_detail/components/text_bold.dart';
import 'package:one_on_one_learning/screens/course_detail/components/topic_card.dart';

class TopicExpand extends StatefulWidget {
  const TopicExpand({Key? key, this.topics}) : super(key: key);
  final List<Topics>? topics;

  @override
  _TopicExpandState createState() => _TopicExpandState();
}

class _TopicExpandState extends State<TopicExpand> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    return widget.topics == null
        ? const Center(
            child: Text(
              'No Topic',
              style: TextStyle(fontSize: 20),
            ),
          )
        : Container(
            margin: const EdgeInsets.all(0),
            color: Colors.green,
            child: ExpansionPanelList(
              animationDuration: const Duration(milliseconds: 400),
              children: [
                ExpansionPanel(
                  headerBuilder: (context, isExpanded) {
                    // return TitleBlueBold(
                    //   text: "Rating and Comment (${widget.topics!.length})",
                    // );
                    return ListTile(
                      title: Center(
                        child: TextBold(
                          text: "${widget.topics!.length} Topics",
                          color: Colors.blue,
                        ),
                      ),
                    );
                  },
                  body: SizedBox(
                    child: Column(
                      children: widget.topics!
                          .map(
                            (item) => TopicCard(
                              topic: item.orderCourse.toString(),
                              title: item.name!,
                              url: item.nameFile!,
                            ),
                          )
                          .toList()
                          .cast<Widget>(),
                    ),
                  ),
                  isExpanded: _expanded,
                  canTapOnHeader: true,
                ),
              ],
              dividerColor: Colors.grey,
              expansionCallback: (panelIndex, isExpanded) {
                _expanded = !_expanded;
                setState(() {});
              },
            ),
          );
  }
}
