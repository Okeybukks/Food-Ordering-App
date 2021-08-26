import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'meal_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MealWidget extends StatelessWidget {
  final Widget image;
  final String title, subtitle, price;

  MealWidget(
      {required this.image,
      required this.title,
      required this.subtitle,
      required this.price});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    double height2 = height * 0.17;
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      secondaryActions: <Widget>[

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            margin: EdgeInsets.only(top: 0),
            height: height * 0.17,
            width: width * 0.3,
            child: Container(
              height: height2 * 0.02,
              width: height2 * 0.02,
              decoration: BoxDecoration(
                  color: Color(0xFFF54749), shape: BoxShape.circle),
            ),
            decoration: BoxDecoration(
                color: Color(0xFF100B18),
                borderRadius: BorderRadius.circular(20)),
          ),
        ),
      ],
      child: Container(
        height: height2,
        width: width,
        margin: EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            ClipPath(
              clipper: BackgroundClipper(),
              child: Container(
                height: height * 0.17,
                width: width * 0.5,
                decoration: BoxDecoration(color: Colors.white),
                child: image,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(right: 10, top: 15, bottom: 15),
                width: width * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(title,
                        style: TextStyle(
                            fontSize: 26,
                            fontFamily: 'Fira',
                            fontWeight: FontWeight.w600)),
                    Text(subtitle,
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Fira',
                            fontWeight: FontWeight.w500)),
                    Text(price,
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'Fira',
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var roundnessFactor = 20.0;
    var path = Path();
    path.moveTo(0, 20);
    path.lineTo(0, size.height - roundnessFactor);
    path.quadraticBezierTo(0, size.height, roundnessFactor, size.height);
    path.lineTo(size.width - roundnessFactor, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - roundnessFactor);
    path.lineTo(size.width * 0.8, 10);
    path.quadraticBezierTo(size.width * 0.78, 0, size.width * 0.75, 0);
    path.lineTo(roundnessFactor, 0);
    path.quadraticBezierTo(0, 0, 0, roundnessFactor);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
