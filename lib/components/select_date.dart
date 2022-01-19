import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SelectDate extends StatefulWidget {
  const SelectDate({Key? key, required this.date}) : super(key: key);
  final String date;

  @override
  _SelectDateState createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  var _date = DateTime.now();
  @override
  void initState() {
    super.initState();
    _date = DateFormat("yyyy-MM-dd").parse(widget.date);
  }

  // ignore: prefer_void_to_null
  Future<Null> _selecDate(BuildContext context) async {
    DateTime? _datePicer = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1800),
      lastDate: DateTime(2100),
      helpText: 'Birthday',
    );

    if (_datePicer != null && _datePicer != _date) {
      setState(() {
        _date = _datePicer;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var format = DateFormat('yyyy-MM-dd').format(_date);
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Birth Of Day',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey.shade50,
                elevation: 0,
                alignment: Alignment.centerLeft,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(color: Colors.grey),
                ),
              ),
              onPressed: () {
                setState(() {
                  _selecDate(context);
                });
              },
              child: Text(
                format,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
