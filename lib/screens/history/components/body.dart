import 'package:flutter/material.dart';

import 'history_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // const SearchBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  HistoryCard(),
                  HistoryCard(),
                  HistoryCard(),
                  HistoryCard(),
                  HistoryCard(),
                  HistoryCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
