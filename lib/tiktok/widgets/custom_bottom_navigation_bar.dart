import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar(
      {super.key, required this.selectedPageIndex, required this.onIconTap});
  final int selectedPageIndex;
  final Function onIconTap;

  @override
  Widget build(BuildContext context) {
    final barHeight = MediaQuery.of(context).size.height * 0.06;

    return BottomAppBar(
      child: Container(
        height: barHeight,
        child: Row(
          children: [__bottomBarNavItem(1, 'Home', TextStyle(), 'home')],
        ),
      ),
    );
  }

  __bottomBarNavItem(
      int index, String label, TextStyle textStyle, String iconName) {
    bool isSelected = selectedPageIndex == index;
    Color iconAndTextColor = isSelected ? Colors.black : Colors.grey;

    if (isSelected && selectedPageIndex == 0) {
      iconAndTextColor = Colors.white;
    }

    return Column(
      children: [
        SvgPicture.asset(
            'assets/${isSelected ? iconName + '_filled' : iconName}.svg'),
        SizedBox(
          height: 3,
        ),
      ],
    );
  }
}