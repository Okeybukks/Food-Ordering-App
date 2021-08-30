import 'package:flutter/material.dart';

class TopBoxWidget extends StatelessWidget {
  const TopBoxWidget({
    Key? key,
    required this.height, required this.icon,
  }) : super(key: key);

  final double height;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.06,
      width: height * 0.06,
      decoration: BoxDecoration(
          color:  Color(0xFFF54749),
          borderRadius: BorderRadius.circular(15)
      ),
      child: icon,
    );
  }
}