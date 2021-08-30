import 'package:clip/profile_image.dart';
import 'package:flutter/material.dart';
import 'meal.dart';
import 'meal_model.dart';
import 'dropdown.dart';


class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return GestureDetector(
      onTap: () {
        FocusNode isCurrentFocusNode = FocusScope.of(context);
        if (!isCurrentFocusNode.hasPrimaryFocus) {
          isCurrentFocusNode.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: height * 0.09,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Center(child: LocationDropdown()),
          actions: [
            ProfileImage(),
            SizedBox(
              width: width * 0.05,
            ),
          ],
          iconTheme: IconThemeData(color: Colors.black),
        ),
        drawer: Drawer(),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: height,
            padding: EdgeInsets.symmetric(
                vertical: height * 0.02, horizontal: width * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, Jenny',
                  style: TextStyle(fontSize: height * 0.037),
                ),
                RichText(
                    text: TextSpan(
                        text: 'Best Food for ',
                        style: TextStyle(
                            fontSize: height * 0.041,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        children: [
                      TextSpan(
                          text: 'you', style: TextStyle(color: Color(0xFFF54749)))
                    ])),
                SizedBox(
                  height: height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Material(
                      elevation: 1,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        width: width * 0.7,
                        height: height * 0.06,
                        child: TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              labelText: 'Search',
                              labelStyle: TextStyle(fontSize: height * 0.03),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                      ),
                    ),
                    Material(
                      elevation: 1,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: width * 0.125,
                        height: height * 0.055,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                            'images/filter.png',
                          )),
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFF54749),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Container(
                  height: height * 0.06,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: meals.length,
                      itemBuilder: (BuildContext context, int index) =>
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                                margin: EdgeInsets.only(right: 15),
                                height: height * 0.06,
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                    color: selectedIndex == index
                                        ? Color(0xFFF54749)
                                        : Color(0xFFEBEBEB),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      height: height * 0.03,
                                      width: height * 0.03,
                                      child: meals[index].mealIcon,
                                    ),
                                    SizedBox(
                                      width: width * 0.03,
                                    ),
                                    Text(
                                      meals[index].mealCategory,
                                      style: TextStyle(
                                          fontSize: height * 0.028,
                                          fontWeight: selectedIndex == index
                                              ? FontWeight.bold
                                              : null,
                                          color: selectedIndex == index
                                              ? Colors.white
                                              : null),
                                    )
                                  ],
                                )),
                          )),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Expanded(
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      // shrinkWrap: true,
                      itemCount: meal.length,
                      itemBuilder: (context, index) => MealWidget(
                        image: meal[index].mealImage,
                        title: meal[index].mealName,
                        subtitle: meal[index].mealType,
                        price: meal[index].mealAmount,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
