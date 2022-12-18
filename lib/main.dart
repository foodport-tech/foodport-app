import 'package:flutter/material.dart';
import '../responsive/mobile_screen_layout.dart';
import '../responsive/responsive_layout_screen.dart';
import '../responsive/tablet_screen_layout.dart';
import '../responsive/web_screen_layout.dart';
import '../utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodport',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      home: const ResponsiveLayout(
        mobileScreenLayout: MobileScreenLayout(),
        tabletScreenLayout: TabletScreenLayout(),
        webScreenLayout: WebScreenLayout(),
      ), //const HomeScreen(),
    );
  }
}
