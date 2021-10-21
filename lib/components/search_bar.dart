import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0xffe0e0e0),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 4,
            vertical: 8,
          ),
          child: Row(
            children: [
              const Icon(
                CupertinoIcons.search,
                color: Color.fromRGBO(128, 128, 128, 1),
              ),
              const Expanded(
                child: CupertinoTextField(
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                  ),
                  cursorColor: Color.fromRGBO(0, 122, 255, 1),

                  decoration: null,
                ),
              ),
              GestureDetector(
                child: const Icon(
                  CupertinoIcons.clear_thick_circled,
                  color: Color.fromRGBO(128, 128, 128, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
