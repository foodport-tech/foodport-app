import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget webScreenLayout;
  final Widget tabletScreenLayout;
  final Widget mobileScreenLayout;
  const ResponsiveLayout(
      {super.key,
      required this.webScreenLayout,
      required this.tabletScreenLayout,
      required this.mobileScreenLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      // Check if the screen width is a webScreenLayout
      if (constraints.maxWidth > webScreenSize) {
        return webScreenLayout;
        // Check if the screen width is a tabletScreenLayout
      } else if (constraints.maxWidth > tabletScreenSize) {
        return tabletScreenLayout;
      }
      // Check if the screen width is a mobileScreenLayout
      return mobileScreenLayout;
    });
  }
}
