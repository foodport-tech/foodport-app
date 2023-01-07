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
              width: 20,
              height: 20,
              color: _page == 0 ? primaryColor : secondaryColor,
            ),
            // icon: Icon(
            //   Icons.home_outlined,
            //   color: _page == 0 ? primaryColor : secondaryColor,
            // ),
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/icons/explore.png',
              width: 20,
              height: 20,
              color: _page == 1 ? primaryColor : secondaryColor,
            ),
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              color: _page == 2 ? primaryColor : secondaryColor,
            ),
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/icons/inbox.png',
              width: 20,
              height: 20,
              color: _page == 3 ? primaryColor : secondaryColor,
            ),
            backgroundColor: primaryColor,
          ),
          // User Profile
          BottomNavigationBarItem(
            icon: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: _page == 4 ? primaryColor : secondaryColor,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              // User's Profile Picture
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14.0),
                child: Container(
                  child: Image.network(
                    'https://instagram.fkul10-1.fna.fbcdn.net/v/t51.2885-19/241461462_270079921407951_7468759206826799783_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.fkul10-1.fna.fbcdn.net&_nc_cat=103&_nc_ohc=Y-O5tWwzPNgAX8Zkqjt&edm=ACWDqb8BAAAA&ccb=7-5&oh=00_AfA8NGJlCJaRI-n3Jnng71R2Cn18LOeD_5mwHiX9RlSkHQ&oe=63BBF319&_nc_sid=1527a3',
                    height: 28,
                    width: 28,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // icon: Icon(
            //   Icons.person_outline,
            //   color: _page == 4 ? primaryColor : secondaryColor,
            // ),
            backgroundColor: primaryColor,
          ),
        ],
        onTap: navigationTapped,
      ),
    );
  }
}
