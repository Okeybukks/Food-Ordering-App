import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Center(
      child: Container(
        height: height * 0.06,
        width: height * 0.06,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/Passport.jpg'), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
  }
}
