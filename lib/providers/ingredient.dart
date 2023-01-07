import 'package:flutter/foundation.dart';

// https://www.fda.gov/food/food-ingredients-packaging/overview-food-ingredients-additives-colors
class Ingredient with ChangeNotifier {
  final String ingredientId;
  final String ingredientName;
  final String ingredientPhotoUrl;
  final String? ingredientType;

  Ingredient({
    required this.ingredientId,
    required this.ingredientName,
    required this.ingredientPhotoUrl,
    this.ingredientType,
  });
}
