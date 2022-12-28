import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/posts.dart';

class DishDetailScreen extends StatelessWidget {
  const DishDetailScreen({super.key});
  static const routeName = '/dish_detail';

  @override
  Widget build(BuildContext context) {
    // Get dishId
    // Data pass from Navigator(arguments:) of 'post_card.dart'
    final dishId = ModalRoute.of(context)!.settings.arguments as String?;

    // Data pass from database -> 'posts.dart'
    // 'listen: false' As only get data once, and to not keep updating widget when data changes
    final loadedPost =
        Provider.of<Posts>(context, listen: false).findByPostId(dishId!);

    // If want to get full dish data
    //final loadedDish = Provider.of<Dishes>(context).findByDishId(dishId);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedPost.dishId ?? ''),
        //title: Text(loadedDish.dishId),
      ),
    );
  }
}
