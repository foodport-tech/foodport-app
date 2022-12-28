import 'package:flutter/material.dart';
import 'package:foodport_app/models/dish.dart';

import '../models/post.dart';

class Dishes with ChangeNotifier {
  // Data Source - Dish Content
  List<Dish> _items = [
    Dish(
      dishId: 'd1',
      dishName: 'Chicken Burger',
      dishPrice: 12.50,
      sellerId: '',
      postId: [
        'p1',
      ],
      dishIngredient: '',
      dishNutrition: '',
      dishInfoContributor: '',
    ),
    Dish(
      dishId: 'd2',
      dishName: 'Lamb Burger',
      dishPrice: 15.90,
      sellerId: '',
      postId: [],
      dishIngredient: '',
      dishNutrition: '',
      dishInfoContributor: '',
    ),
  ];

  List<Dish> get dishItems {
    // Return a copy by using '[...]'
    // Reference: https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/15100258#overview
    return [..._items];
  }

  Dish findByDishId(String dishId) {
    return _items.firstWhere((dish) => dish.dishId == dishId);
  }
}
