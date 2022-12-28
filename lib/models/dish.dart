import 'package:flutter/foundation.dart';

class Dish with ChangeNotifier {
  final String dishId;
  final String dishName;
  final double? dishPrice;
  final String? sellerId;
  final postId;
  final dishIngredient;
  final dishNutrition;
  final dishInfoContributor;
  Dish({
    required this.dishId,
    required this.dishName,
    this.dishPrice,
    this.sellerId,
    this.postId,
    this.dishIngredient,
    this.dishNutrition,
    this.dishInfoContributor,
  });
}
