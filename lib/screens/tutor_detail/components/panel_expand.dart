import 'package:flutter/material.dart';
import 'package:one_on_one_learning/components/title_blue_bold.dart';
import 'package:one_on_one_learning/models/feedback.dart';

import 'rating_comment_card.dart';

class PanelExpand extends StatefulWidget {
  const PanelExpand({Key? key, this.feedbacks}) : super(key: key);
  final List<Feedbacks>? feedbacks;

  @override
  _PanelExpandState createState() => _PanelExpandState();
}

class _PanelExpandState extends State<PanelExpand> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    return widget.feedbacks == null
        ? const Center(
            child: Text(
              'No rating and comment.',
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
                    //   text: "Rating and Comment (${widget.feedbacks!.length})",
                    // );
                    return ListTile(
                        title: TitleBlueBold(
                      text: "Rating and Comment (${widget.feedbacks!.length})",
                    ));
                  },
                  body: SizedBox(
                    child: Column(
                      children: widget.feedbacks!
                          .map(
                            (item) => RatingCommentCard(
                              feedbacks: item,
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
