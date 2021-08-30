import 'package:clip/menu.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'images.dart';
import 'menu.dart';

class HomePageContainer extends StatelessWidget {
  const HomePageContainer({
    Key? key,
    required this.width,
    required this.height,
    required CarouselController controller,
    required int current,
  })
      : _controller = controller,
        _current = current,
        super(key: key);

  final double width;
  final double height;
  final CarouselController _controller;
  final int _current;

  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.07),
      height: height * 0.6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            topLeft: Radius.circular(50)),
      ),
      child: Column(
        children: [
          SizedBox(
            height: height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList
                .asMap()
                .entries
                .map((entry) {
              return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: _current == entry.key ? 16 : 8,
                    height: 8.0,
                    margin: EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      shape: BoxShape.rectangle,
                      color: _current == entry.key
                          ? Color(0xFFF54749)
                          : Colors.black,
                    ),
                  ));
            }).toList(),
          ),
          SizedBox(
            height: height * 0.035,
          ),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'Quick delivery at your ',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontSize: height * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                        text: 'Doorstep',
                        style: TextStyle(color: Color(0xFFF54749)))
                  ])),
          SizedBox(
            height: height * 0.04,
          ),
          Text(
            'Our app will make your food ordering pleasant and fast.',
            style: TextStyle(
                color: Color(0xFF7D7D7D),
                fontSize: height*0.022,
                fontFamily: 'Poppins'),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: height * 0.15,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    print('A');
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: height * 0.04,
                        color: Colors.black54),
                  ),
                  style:
                  TextButton.styleFrom(primary: Colors.white70),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) =>MenuPage()));
                  },
                  child: Text(
                    'Next',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: height * 0.04,
                        color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(15)),
                      primary: Color(0xFFF54749),
                      padding: EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}