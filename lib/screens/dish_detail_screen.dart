import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/dishes.dart';
import '../providers/posts.dart';

class DishDetailScreen extends StatelessWidget {
  const DishDetailScreen({super.key});
  static const routeName = '/dish_detail';

  @override
  Widget build(BuildContext context) {
    // Get dishId
    // Data pass from Navigator(arguments:) of 'post_card.dart'
    final postId = ModalRoute.of(context)!.settings.arguments as String?;
    //TEST final dishId = ModalRoute.of(context)!.settings.arguments as String?;
    //TEST print(dishId);

    // Data pass from database -> 'posts.dart'
    // 'listen: false' As only get data once, and to not re-run build
    // (to keep updating widget when data changes)
    final loadedPost =
        Provider.of<Posts>(context, listen: false).findByPostId(postId!);

    // To get full dish data
    // final loadedDish =
    //     Provider.of<Dishes>(context, listen: false).findByDishId(dishId!);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedPost.postId),
        //title: Text(loadedDish.dishId),
      ),
    );
  }
}
