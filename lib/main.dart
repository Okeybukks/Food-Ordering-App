import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_page_container.dart';
import 'images.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(bodyText2: TextStyle(fontFamily: 'Poppins'))),
      home: CarouselWithIndicatorDemo(),
    );
  }
}

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return SafeArea(
      child: GestureDetector(
        onTap: (){
          FocusNode isCurrentFocusNode = FocusScope.of(context);
          if(!isCurrentFocusNode.hasPrimaryFocus){
            isCurrentFocusNode.unfocus();
          }
        },
        child: Scaffold(
          body: Container(
            width: width,
            height: height,
            child: Stack(children: [
              Positioned(
                top: 0,
                left: 0,
                width: width,
                child: CarouselSlider(
                  items: imgList
                      .map((item) => Container(
                            color: Color(0xFFFEDFB3),
                            height: height * 0.6,
                            width: width,
                            child: Image.asset(item, fit: BoxFit.contain),
                          ))
                      .toList(),
                  carouselController: _controller,
                  options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 1,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      // enlargeCenterPage: true,
                      aspectRatio: 1.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
              ),
              Positioned(
                top: height * 0.4,
                width: width,
                left: 0,
                child: HomePageContainer(width: width, height: height, controller: _controller, current: _current),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}


