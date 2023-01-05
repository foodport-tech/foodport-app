import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodport_app/utils/colors.dart';
import 'package:foodport_app/widgets/text_field_input.dart';
import 'package:provider/provider.dart';

import '../../providers/dish.dart';
import '../../providers/dishes.dart';
import '../../widgets/dish_card/nearby_dish_card.dart';
import '../../widgets/dish_card/trending_dish_card.dart';

class ExploreScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final dishesData = Provider.of<Dishes>(context);
    // IMPROVEMENT: postsData.followingPostItems
    // to only get posts from the accounts followed
    final dishes = dishesData.dishItems;

    return Scaffold(
      appBar: AppBar(
        elevation: 0, // Remove shadow
        backgroundColor: mobileBackgroundColor,
        titleSpacing: 0,
        toolbarHeight: 64,
        title: Container(
          padding: EdgeInsets.only(top: 16, left: 16, bottom: 16),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 12.0,
                      top: 8.0,
                      bottom: 8.0,
                      right: 8.0,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: neutral1Color,
                        ),
                        Text(
                          'Viral golden chicken burger',
                          style: TextStyle(
                              fontSize: 16,
                              color: neutral3Color,
                              fontFamily: 'OpenSans'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.camera_alt_outlined,
                  color: neutral1Color,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      backgroundColor: mobileBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 16, left: 32, right: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 1-Click
                    Container(
                      width: 104,
                      height: 80,
                      padding: EdgeInsets.only(left: 14, bottom: 11),
                      alignment: Alignment.bottomLeft,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                            color: neutral5Color,
                            spreadRadius: 0,
                            blurRadius: 28,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Text(
                        '1-Click',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: neutral1Color,
                        ),
                      ),
                    ),
                    // Maps
                    Container(
                      width: 104,
                      height: 80,
                      padding: EdgeInsets.only(left: 14, bottom: 12),
                      alignment: Alignment.bottomLeft,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                            color: neutral5Color,
                            spreadRadius: 0,
                            blurRadius: 16,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Text(
                        'Maps',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: neutral1Color,
                        ),
                      ),
                    ),
                    // New Release
                    Container(
                      width: 104,
                      height: 80,
                      padding: EdgeInsets.only(left: 14, bottom: 11),
                      alignment: Alignment.bottomLeft,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                            color: neutral5Color,
                            spreadRadius: 0,
                            blurRadius: 16,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Text(
                        'New Release',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: neutral1Color,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // NEARBY SECTION
              Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 32),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Text(
                      'Nearby',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: neutral1Color,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Text(
                      'More',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: neutral3Color,
                      ),
                    ),
                  ],
                ),
              ),

              // NEARBY CARD SECTION
              NearbyDishCard(dishes: dishes),

              // TRENDING SECTION
              Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 32),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Text(
                      'Trending',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: neutral1Color,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Text(
                      'More',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: neutral3Color,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ],
                ),
              ),

              // TRENDING CARD SECTION
              TrendingDishCard(dishes: dishes),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
