import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodport_app/left_drawer.dart';
import 'package:foodport_app/utils/colors.dart';

import '../screens/6_analytics_screen/analytics_overview_screen.dart';

class WebScreenLayout extends StatefulWidget {
  const WebScreenLayout({super.key});

  @override
  State<WebScreenLayout> createState() => _WebScreenLayoutState();
}

class _WebScreenLayoutState extends State<WebScreenLayout> {
  int _page = 4;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: webBackgroundColor,
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              color: webBackgroundColor,
              child: Column(
                children: [
                  // LOGO
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 32.0,
                        bottom: 32.0,
                      ),
                      child: SvgPicture.asset(
                        'assets/images/logos/foodport_text_logo.svg',
                        height: 32,
                        color: primaryColor,
                      ),
                    ),
                  ),

                  // MENU ITEMS
                  // Home
                  ListTile(
                    leading: Image.asset(
                      'assets/images/icons/home.png',
                      width: 24,
                      height: 24,
                      color: _page == 0 ? primaryColor : secondaryColor,
                    ),
                    title: Text(
                      "Home",
                      style: TextStyle(
                        color: neutral1Color,
                      ),
                    ),
                    onTap: () {},
                  ),

                  // Explore
                  ListTile(
                    leading: Image.asset(
                      'assets/images/icons/explore.png',
                      width: 24,
                      height: 24,
                      color: _page == 1 ? primaryColor : secondaryColor,
                    ),
                    title: Text(
                      "Explore",
                      style: TextStyle(
                        color: neutral1Color,
                      ),
                    ),
                    onTap: () {},
                  ),

                  // Create Post
                  ListTile(
                    leading: Icon(
                      Icons.add,
                      color: _page == 2 ? primaryColor : secondaryColor,
                    ),
                    title: Text(
                      "Create Post",
                      style: TextStyle(
                        color: neutral1Color,
                      ),
                    ),
                    onTap: () {},
                  ),

                  // Inbox
                  ListTile(
                    leading: Image.asset(
                      'assets/images/icons/inbox.png',
                      width: 24,
                      height: 24,
                      color: _page == 3 ? primaryColor : secondaryColor,
                    ),
                    title: Text(
                      "Inbox",
                      style: TextStyle(
                        color: neutral1Color,
                      ),
                    ),
                    onTap: () {},
                  ),

                  // Analytics
                  ListTile(
                    leading: Image.asset(
                      'assets/images/icons/explore.png',
                      width: 24,
                      height: 24,
                      color: _page == 4 ? primaryColor : secondaryColor,
                    ),
                    title: Text(
                      "Analytics",
                      style: TextStyle(
                        color: neutral1Color,
                      ),
                    ),
                    onTap: () {},
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: orange3Color,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 32,
                        top: 16.0,
                        bottom: 16.0,
                      ),
                      child: Text(
                        "Overview",
                        style: TextStyle(
                          color: neutral1Color,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 32,
                        top: 16.0,
                        bottom: 16.0,
                      ),
                      child: Text(
                        "Dish",
                        style: TextStyle(
                          color: neutral1Color,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 32,
                        top: 16.0,
                        bottom: 16.0,
                      ),
                      child: Text(
                        "Shop",
                        style: TextStyle(
                          color: neutral1Color,
                        ),
                      ),
                    ),
                  ),

                  // Profile
                  ListTile(
                    leading: Container(
                      height: 26,
                      width: 26,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: _page == 5 ? primaryColor : secondaryColor,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      // User's Profile Picture
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14.0),
                        child: Container(
                          child: Image.network(
                            'https://media.istockphoto.com/id/936928380/photo/portrait-of-a-mid-adult-male.jpg?s=612x612&w=0&k=20&c=U_nnHIwP61jYJvRhjCdOjrye4CPlcOCmKmHKXefoiPg=',
                            height: 24,
                            width: 24,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      "Profile",
                      style: TextStyle(
                        color: neutral1Color,
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: AnalyticsOverview(),
          ),
        ],
      ),
    );
  }
}
