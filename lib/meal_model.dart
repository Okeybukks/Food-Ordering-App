import 'package:flutter/material.dart';

class Meal {
  String mealName, mealType, mealAmount;
  Image mealImage;

  Meal(
      {required this.mealAmount,
      required this.mealImage,
      required this.mealName,
      required this.mealType});
}

class Meals {
  String mealCategory;
  Image mealIcon;

  Meals({required this.mealIcon, required this.mealCategory});
}

List<Meals> meals = [
  Meals(mealIcon: Image.asset('images/pizza.png'), mealCategory: 'Pizza'),
  Meals(mealIcon: Image.asset('images/burger.png'), mealCategory: 'Burger'),
  Meals(mealIcon: Image.asset('images/fries.png'), mealCategory: 'French Fry'),
  Meals(mealIcon: Image.asset('images/ice.png'), mealCategory: 'Ice Cream'),
];

List<Meal> meal = [
  Meal(
      mealAmount: '\$4.99',
      mealImage: Image.asset('images/burger/bug5.jpg', fit: BoxFit.cover),
      mealName: 'Whopper Jr.',
      mealType: 'Mushroom & chilli'),
  Meal(
      mealAmount: '\$4.99',
      mealImage: Image.asset('images/burger/bug2.jpg',fit: BoxFit.cover),
      mealName: 'Hamburger',
      mealType: 'Mushroom & chilli'),
  Meal(
      mealAmount: '\$4.50',
      mealImage: Image.asset('images/burger/bug3.jpg', fit: BoxFit.cover),
      mealName: 'Bacon king',
      mealType: 'Bacon and olives'),
  Meal(
      mealAmount: '\$9.45',
      mealImage: Image.asset('images/burger/bug4.jpg', fit: BoxFit.cover),
      mealName: 'Cheeseburger',
      mealType: 'Mushroom & chilli'),
  Meal(
      mealAmount: '\$4',
      mealImage: Image.asset('images/burger/bug5.jpg', fit: BoxFit.cover,),
      mealName: 'Whopper Jr',
      mealType: 'Mushroom & chilli')
];
