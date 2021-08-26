import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/Passport.jpg'), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
  }
}
