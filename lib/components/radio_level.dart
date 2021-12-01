import 'package:flutter/material.dart';

class RadioLevel extends StatefulWidget {
  const RadioLevel({Key? key}) : super(key: key);

  @override
  _RadioLevelState createState() => _RadioLevelState();
}

enum SingingCharacter { beginner, intermediate, advanced }

class _RadioLevelState extends State<RadioLevel> {
  SingingCharacter? _character = SingingCharacter.beginner;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'I am best at teaching students who are',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 10),
          ListTile(
            title: const Text('Beginner'),
            minVerticalPadding: 0,
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.beginner,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Intermediate'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.intermediate,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Advanced'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.advanced,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
