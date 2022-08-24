import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class CategoryBox extends StatelessWidget {
  const CategoryBox(
      {Key? key,
      required this.index,
      required this.currentIndex,
      required this.title,
      this.selectedColor,
      this.unSelectedColor,
      this.borderRadius, this.hasBorder})
      : super(key: key);
  final int currentIndex;
  final int index;
  final String title;
  final Color? selectedColor;
  final Color? unSelectedColor;
  final double? borderRadius;
  final bool?hasBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          border: hasBorder==true?(currentIndex != index
              ? Border.all(color: AppColors.darkGrey)
              : null):null,
          color: currentIndex == index
              ? selectedColor ?? AppColors.transparent
              : unSelectedColor ?? AppColors.grey),
      child: Text(title),
    );
  }
}
