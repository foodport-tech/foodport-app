import 'package:flutter/material.dart';

import 'dish.dart';

class Dishes with ChangeNotifier {
  // Data Source - Dish Content
  List<Dish> _items = [
    Dish(
      dishId: 'd1',
      dishName: "NaCC Lemak Sando",
      dishPrice: 33.00,
      sellerId: 's1',
      postId: [
        'p1',
      ],
      dishMainIngredient:
          "Chicken Katsu, Ebi Sambal, Truffled Eggs, Cucumber, Pandan Loaf",
      dishIngredient: "bread, egg, ham, patty, cheese, mayonaise, blackpepper",
      dishNutrition:
          "calories-266g, fat-10g, sodium-396mg, carbohydrates-30g, fiber-1g, sugars-5g, protein-13g",
      dishInfoContributor: '',
    ),
    Dish(
      dishId: 'd2',
      dishName: "Smoked Duck Bikini",
      dishPrice: 25.00,
      sellerId: 's1',
      postId: [],
      dishMainIngredient: "Smoked Duck Breast | Aji Verde | Brie Cheese",
      dishIngredient: "",
      dishNutrition: 'd2 nutrition',
      dishInfoContributor: '',
    ),
    Dish(
      dishId: 'd3',
      dishName: "Citrus Anchovy",
      dishPrice: 18.20,
      sellerId: 's1',
      postId: [],
      dishMainIngredient: "",
      dishIngredient: 'd3 ingredient',
      dishNutrition: 'd3 nutrition',
      dishInfoContributor: '',
    ),
    Dish(
      dishId: 'd4',
      dishName: "Konbu Asari",
      dishPrice: 15.90,
      sellerId: 's1',
      postId: [],
      dishMainIngredient: "",
      dishIngredient: 'd2 ingredient',
      dishNutrition: 'd2 nutrition',
      dishInfoContributor: '',
    ),
    Dish(
      dishId: 'd5',
      dishName: "Miso Lamb Ragu",
      dishPrice: 18.20,
      sellerId: 's1',
      postId: [],
      dishMainIngredient: "",
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

  Dish findByDishId(int dishId) {
    return _items.firstWhere((dish) => dish.dishId == dishId);
  }
}
