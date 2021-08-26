import 'package:flutter/material.dart';

class LocationDropdown extends StatefulWidget {
  const LocationDropdown({Key? key}) : super(key: key);

  @override
  _LocationDropdownState createState() => _LocationDropdownState();
}

class _LocationDropdownState extends State<LocationDropdown> {
  String _dropDownString = "";

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        elevation: 0,
        icon: Icon(Icons.expand_more_rounded),
        hint: _dropDownString == ""
            ? Text(
                'Location',
                style: TextStyle(fontSize: 25),
              )
            : Text(
                _dropDownString,
                style: TextStyle(fontSize: 25),
              ),
        items: ['Abuja', 'Lagos', 'Aba']
            .map((value) => DropdownMenuItem<String>(
                value: value, child: Center(child: Text(value))))
            .toList(),
        onChanged: (String? value) {
          setState(() {
            _dropDownString = value!;
          });
        },
        iconSize: 20,
      ),
    );
  }
}
