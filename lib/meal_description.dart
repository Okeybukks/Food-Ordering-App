import 'package:clip/roundbutton.dart';
import 'package:clip/topbox_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constant.dart';

class MealScreen extends StatefulWidget {
  const MealScreen({Key? key}) : super(key: key);

  @override
  _MealScreenState createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  int weight = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: height,
            width: width,
            margin: EdgeInsets.symmetric(
                vertical: width * 0.03, horizontal: width * 0.04),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: TopBoxWidget(
                          height: height,
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        )),
                    GestureDetector(
                      onTap: () {},
                      child: TopBoxWidget(
                        height: height,
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  height: height * 0.37,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('images/burger/burger1.png'),
                  )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(
                      'Bacon King',
                      style: TextStyle(
                        letterSpacing: width * 0.0001,
                          fontFamily: 'Fira',
                          fontWeight: FontWeight.w600,
                          fontSize: height * 0.043),
                    ),
                    Text('\$10.99',
                        style: TextStyle(
                            fontFamily: 'Fira',
                            fontWeight: FontWeight.bold,
                            fontSize: height * 0.025))
                  ],
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                Text('Flame-Grilled beef patties',
                    style: TextStyle(
                        fontFamily: 'Fira',
                        color: Color(0xFFA9A9A9),
                        fontWeight: FontWeight.w600,
                        fontSize: height * 0.02)),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Color(0xFFCF5D09),
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    Text('(4.9)',
                        style: TextStyle(
                            fontFamily: 'Fira',
                            fontWeight: FontWeight.bold,
                            fontSize: height * 0.028))
                  ],
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                Text(text,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xFFA9A9A9),
                        fontSize: height * 0.024)),
                SizedBox(
                  height: height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: height * 0.07,
                      width: width * 0.42,
                      padding: EdgeInsets.all(width * 0.01),
                      decoration: BoxDecoration(
                          color: Color(0xFFF54749),
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          RoundButton(
                            iconValue: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            buttonColor: Colors.transparent,
                            onPress: () {
                              setState(() {
                                if (weight == 1) {
                                  weight = 1;
                                } else {
                                  weight -= 1;
                                }
                              });
                            },
                          ),
                          Text('$weight',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: height * 0.045)),
                          RoundButton(
                            iconValue: Icon(
                              Icons.add,
                              color: Color(0xFFF54749),
                            ),
                            buttonColor: Colors.white,
                            onPress: () {
                              setState(() {
                                weight += 1;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                        width: width * 0.4,
                        height: height * 0.07,
                        decoration: BoxDecoration(
                            color: Color(0xFFF54749),
                            borderRadius: BorderRadius.circular(50)),
                      child: Center(child: Text('Place Order', style: TextStyle(color: Colors.white, fontSize: height * 0.025, fontWeight: FontWeight.bold),)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
