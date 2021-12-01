import 'package:flutter/material.dart';

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
            flex: 2,
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
