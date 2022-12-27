import 'package:flutter/material.dart';
import 'package:foodport_app/providers/user_provider_ig.dart';
import 'package:provider/provider.dart';
import '../utils/colors.dart';
import '../utils/global_variables.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget webScreenLayout;
  final Widget tabletScreenLayout;
  final Widget mobileScreenLayout;
  const ResponsiveLayout(
      {super.key,
      required this.webScreenLayout,
      required this.tabletScreenLayout,
      required this.mobileScreenLayout});

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  void initState() {
    super.initState();
    addData();
  }

  addData() async {
    UserProvider _userProvider = Provider.of(context, listen: false);
    await _userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      // Check if the screen width is a webScreenLayout
      if (constraints.maxWidth > webScreenSize) {
        return widget.webScreenLayout;
        // Check if the screen width is a tabletScreenLayout
      } else if (constraints.maxWidth > tabletScreenSize) {
        return widget.tabletScreenLayout;
      }
      // Check if the screen width is a mobileScreenLayout
      return widget.mobileScreenLayout;
    });
  }
}
