import 'package:flutter/material.dart';

import 'ingredient.dart';

// https://food.ndtv.com/ingredient
// https://www.allrecipes.com/ingredients-a-z-6740416
class Ingredients with ChangeNotifier {
  List<Ingredient> _items = [
    Ingredient(
      ingredientId: 'i1',
      ingredientName: "Chicken Katsu",
      ingredientPhotoUrl: '',
      ingredientType: "",
    ),
    Ingredient(
      ingredientId: 'i2',
      ingredientName: "Ebi Sambal",
      ingredientPhotoUrl: '',
      ingredientType: "",
    ),
    Ingredient(
      ingredientId: 'i3',
      ingredientName: "Truffled Eggs",
      ingredientPhotoUrl: '',
      ingredientType: "",
    ),
    Ingredient(
      ingredientId: 'i4',
      ingredientName: "Cucumber",
      ingredientPhotoUrl: '',
      ingredientType: "",
    ),
    Ingredient(
      ingredientId: 'i3',
      ingredientName: "Pandan Loaf",
      ingredientPhotoUrl: '',
      ingredientType: "",
    ),
  ];

  List<Ingredient> get ingredientItems {
    // Return a copy by using '[...]'
    // Reference: https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/15100258#overview
    return [..._items];
  }
}
