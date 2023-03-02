import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodport_app/utils/colors.dart';

import '../utils/global_variables.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
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
    // Get User Data
    // model.User user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      body: PageView(
        children: homeScreenItems,
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: mobileBackgroundColor,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/icons/home.png',
              width: 24,
              height: 24,
              color: _page == 0 ? primaryColor : neutral4Color,
            ),
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/icons/explore.png',
              width: 24,
              height: 24,
              color: _page == 1 ? primaryColor : neutral4Color,
            ),
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              color: _page == 2 ? primaryColor : neutral4Color,
            ),
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/icons/inbox.png',
              width: 24,
              height: 24,
              color: _page == 3 ? primaryColor : neutral4Color,
            ),
            backgroundColor: primaryColor,
          ),
          // User Profile
          BottomNavigationBarItem(
            icon: Container(
              height: 26,
              width: 26,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: _page == 4 ? primaryColor : neutral4Color,
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
            backgroundColor: primaryColor,
          ),
        ],
        onTap: navigationTapped,
      ),
    );
  }
}
