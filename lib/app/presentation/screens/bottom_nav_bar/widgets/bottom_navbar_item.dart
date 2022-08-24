import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_colors.dart';

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({
    Key? key,
    required this.index,
    required this.currentIndex,
    required this.iconPath,
  }) : super(key: key);
  final int index;
  final int currentIndex;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      child: Image.asset(
        iconPath,
        color: currentIndex == index ? AppColors.white : AppColors.black,
      ),
    );
    ;
  }
}
