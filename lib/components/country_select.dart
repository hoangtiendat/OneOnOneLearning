import 'package:flutter/material.dart';
import 'package:country_list_pick/country_list_pick.dart';

class CountrySelect extends StatefulWidget {
  const CountrySelect({Key? key}) : super(key: key);

  @override
  _CountrySelectState createState() => _CountrySelectState();
}

class _CountrySelectState extends State<CountrySelect> {
  String _selectedCountry = 'US';
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Country',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey)),
            height: 60,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: CountryListPick(
              onChanged: (CountryCode? code) {
                setState(() {
                  _selectedCountry = code!.name!;
                });
              },
              pickerBuilder: (BuildContext context, CountryCode? countryCode) {
                return Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: Text('${countryCode!.name}',
                      style: const TextStyle(
                          fontSize: 15.5, color: Colors.black54)),
                );
              },
              theme: CountryTheme(
                  isShowFlag: false,
                  isShowTitle: true,
                  isShowCode: false,
                  isDownIcon: false,
                  showEnglishName: false,
                  labelColor: Colors.black54,
                  searchText: 'Search Country'),
              initialSelection: _selectedCountry,
            ),
          ),
        ],
      ),
    );
  }
}
