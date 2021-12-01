import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({Key? key}) : super(key: key);

  @override
  _SelectLanguageState createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  static List<String> languages = [
    'English',
    'Chinese',
    'Hindi',
    'Spanish',
    'French',
    'Arabic',
    'Bengali',
    'Russian',
    'Portuguese',
    'Indonesian',
    'Urdu',
    'German',
    'Vietnamese'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Languages',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 10),
          GFMultiSelect(
            items: languages.map((e) => e).toList(),
            onSelect: (val) {
              // ignore: avoid_print
              print('selected $val');
            },
            dropdownTitleTileMargin:
                const EdgeInsets.only(top: 10, left: 0, right: 0, bottom: 5),
            dropdownTitleTilePadding: const EdgeInsets.all(10),
            dropdownUnderlineBorder:
                const BorderSide(color: Colors.transparent, width: 2),
            dropdownTitleTileBorder: Border.all(color: Colors.grey, width: 1),
            dropdownTitleTileBorderRadius: BorderRadius.circular(12),
            expandedIcon: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.black54,
            ),
            collapsedIcon: const Icon(
              Icons.keyboard_arrow_up,
              color: Colors.black54,
            ),
            submitButton: const Text('OK'),
            dropdownTitleTileTextStyle: const TextStyle(fontSize: 15.5),
            padding: const EdgeInsets.all(6),
            margin: const EdgeInsets.all(6),
            type: GFCheckboxType.circle,
            activeBgColor: GFColors.SUCCESS,
            activeBorderColor: GFColors.SUCCESS,
            inactiveBorderColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
