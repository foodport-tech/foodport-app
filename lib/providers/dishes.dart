import 'package:flutter/material.dart';
import 'package:foodport_app/providers/dish.dart';

import 'post.dart';

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
      dishIngredient: 'd1 ingredient',
      dishNutrition: 'd1 nutrition',
      dishInfoContributor: '',
    ),
    Dish(
      dishId: 'd2',
      dishName: 'Lamb Burger',
      dishPrice: 15.90,
      sellerId: '',
      postId: [],
      dishIngredient: 'd2 ingredient',
      dishNutrition: 'd2 nutrition',
      dishInfoContributor: '',
    ),
    Dish(
      dishId: 'd3',
      dishName: 'Fish Burger',
      dishPrice: 18.20,
      sellerId: '',
      postId: [],
      dishIngredient: 'd3 ingredient',
      dishNutrition: 'd3 nutrition',
      dishInfoContributor: '',
    ),
    Dish(
      dishId: 'd4',
      dishName: 'Lamb Burger',
      dishPrice: 15.90,
      sellerId: '',
      postId: [],
      dishIngredient: 'd2 ingredient',
      dishNutrition: 'd2 nutrition',
      dishInfoContributor: '',
    ),
    Dish(
      dishId: 'd5',
      dishName: 'Fish Burger',
      dishPrice: 18.20,
      sellerId: '',
      postId: [],
      dishIngredient: 'd3 ingredient',
      dishNutrition: 'd3 nutrition',
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
