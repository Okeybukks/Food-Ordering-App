import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final VoidCallback onPress;
  final Widget iconValue;
  final Color buttonColor;
  RoundButton({required this.onPress, required this.iconValue, required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0,
      child: iconValue,
      shape: CircleBorder(),
      onPressed: onPress,
      fillColor:  buttonColor,
      constraints: BoxConstraints.tightFor(
        width: 42,
        height: 42,
      ),
    );
  }
}