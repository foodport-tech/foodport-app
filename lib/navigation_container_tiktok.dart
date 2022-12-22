import 'package:flutter/material.dart';
import 'package:foodport_app/tiktok/pages/add_video_page.dart';
import 'package:foodport_app/tiktok/pages/discover_page.dart';
import 'package:foodport_app/tiktok/pages/home_page.dart';
import 'package:foodport_app/tiktok/pages/inbox_page.dart';
import 'package:foodport_app/tiktok/pages/profile_page.dart';

import 'tiktok/widgets/custom_bottom_navigation_bar.dart';

class NavigationContainer extends StatefulWidget {
  const NavigationContainer({super.key});

  @override
  State<NavigationContainer> createState() => _NavigationContainerState();
}

class _NavigationContainerState extends State<NavigationContainer> {
  int _selectedPageIndex = 0;

  static const List<Widget> _pages = [
    HomePage(),
    DiscoverPage(),
    AddVideoPage(),
    InboxPage(),
    ProfilePage(),
  ];

  void _onIconTapped(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages[_selectedPageIndex],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedPageIndex: _selectedPageIndex,
        onIconTap: _onIconTapped,
      ),
    );
  }
}
