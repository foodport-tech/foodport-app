import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodport_app/utils/colors.dart';
import 'package:foodport_app/widgets/text_field_input.dart';
import 'package:provider/provider.dart';

import '../providers/dish.dart';
import '../providers/dishes.dart';

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
        toolbarHeight: 80,
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
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          color: neutral1Color,
                        ),
                        onPressed: () {},
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
              Container(
                // Cannot remove height
                height: 320,
                child: ListView.builder(
                  padding: EdgeInsets.only(
                    left: 24,
                    right: 24,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: dishes.length,
                  itemBuilder: (context, index) => ChangeNotifierProvider.value(
                    value: dishes[index],
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 16,
                        bottom: 22,
                        left: 8,
                        right: 8,
                      ),
                      width: 160,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        boxShadow: [
                          BoxShadow(
                            color: neutral5Color,
                            spreadRadius: 0,
                            blurRadius: 16,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // Image
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                            child: Image.network(
                              'https://www.bellandevans.com/wp-content/uploads/Apricot_Burger_web-750x560.jpg',
                              width: 160,
                              height: 160,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // Bottom Section
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 12.0,
                                left: 16.0,
                                right: 16.0,
                                bottom: 16.0,
                              ),
                              child: Column(
                                children: [
                                  // Dish Name
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      dishes[index].dishName!,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: neutral1Color,
                                        fontFamily: 'OpenSans',
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 4),

                                  // Rating
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 16,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          '5.0',
                                          style: TextStyle(
                                            color: neutral1Color,
                                            fontFamily: 'OpenSans',
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Icon(
                                          Icons.star,
                                          size: 16,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          '4.9',
                                          style: TextStyle(
                                            color: neutral1Color,
                                            fontFamily: 'OpenSans',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 27),

                                  // Price
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'RM',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: neutral2Color,
                                            fontFamily: 'OpenSans',
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          dishes[index]
                                              .dishPrice!
                                              .toStringAsFixed(2),
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: primaryColor,
                                            fontFamily: 'OpenSans',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

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
              Container(
                // Cannot remove height
                height: 240,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.35,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                  ),
                  padding: EdgeInsets.only(
                    left: 24,
                    right: 24,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: dishes.length,
                  itemBuilder: (context, index) => ChangeNotifierProvider.value(
                    value: dishes[index],
                    // Trending Card
                    child: Container(
                      margin: EdgeInsets.only(
                          top: 0, bottom: 16, left: 8, right: 8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        boxShadow: [
                          BoxShadow(
                            color: neutral5Color,
                            spreadRadius: 0,
                            blurRadius: 16,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          // Image Section
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              bottomLeft: Radius.circular(8.0),
                            ),
                            child: Image.network(
                              'https://media.istockphoto.com/id/1309352410/photo/cheeseburger-with-tomato-and-lettuce-on-wooden-board.jpg?s=612x612&w=0&k=20&c=lfsA0dHDMQdam2M1yvva0_RXfjAyp4gyLtx4YUJmXgg=',
                              height: 104,
                              width: 104,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 16),

                          // Ranking Indicator
                          Icon(
                            Icons.circle,
                            size: 8,
                          ),
                          SizedBox(width: 4),

                          // Ranking Number
                          Text(
                            '1',
                            style: TextStyle(
                              color: neutral1Color,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          SizedBox(width: 12),

                          // Dish Detail Section
                          Expanded(
                            child: Container(
                              height: 200,
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 12),
                                  // Dish Name
                                  Text(
                                    dishes[index].dishName!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: neutral1Color,
                                      fontFamily: 'OpenSans',
                                    ),
                                  ),
                                  SizedBox(height: 8),

                                  // Rating
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 16,
                                      ),
                                      Text(
                                        '4.9',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: neutral3Color,
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Icon(
                                        Icons.star,
                                        size: 16,
                                      ),
                                      Text(
                                        '5.0',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: neutral3Color,
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),

                                  // Price
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'RM',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: neutral2Color,
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        dishes[index]
                                            .dishPrice!
                                            .toStringAsFixed(2),
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: primaryColor,
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                      SizedBox(width: 16),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
