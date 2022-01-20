import 'package:flutter/material.dart';
import 'package:one_on_one_learning/screens/course_detail/components/pdf_viewer.dart';
import 'package:one_on_one_learning/size_config.dart';

import 'text_bold.dart';

class TopicCard extends StatelessWidget {
  const TopicCard({
    Key? key,
    required this.topic,
    required this.title,
    required this.url,
  }) : super(key: key);
  final String topic;
  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
      child: GestureDetector(
        // onTap: () {
        //   showDialog(
        //     context: context,
        //     builder: (BuildContext context) {
        //       return PdfViewer(
        //         fileUrl: url,
        //       );
        //     },
        //   );
        // },
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PdfViewer(
              fileUrl: url,
            ),
          ),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(getProportionateScreenWidth(8)),
            child: Row(children: [
              SizedBox(
                width: getProportionateScreenWidth(50),
                height: getProportionateScreenWidth(50),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: Colors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    side: const BorderSide(color: Colors.deepPurple),
                    backgroundColor: Colors.deepPurple[300],
                    padding: const EdgeInsets.all(4),
                  ),
                  onPressed: () {},
                  child: Text(
                    topic,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(25),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(8),
              ),
              Expanded(
                child: TextBold(
                  text: title,
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
