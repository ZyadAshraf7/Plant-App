import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/fonts_manager.dart';
import '../../core/constants/style_manager.dart';
import '../../core/constants/values_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onTap,
    required this.title,
    this.widget,
    this.maxWidth,
    required this.hasBorder,
    this.borderRadius, this.padding, this.margin,
  }) : super(key: key);
  final VoidCallback onTap;
  final String title;
  final Widget? widget;
  final bool hasBorder;
  final double? borderRadius;
  final double? maxWidth;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth ?? double.infinity),
        margin: margin??const EdgeInsets.symmetric(horizontal: AppMargin.m16),
        padding: padding?? const EdgeInsets.all(AppPadding.p14),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: hasBorder ? AppColors.transparent : AppColors.primaryGreen,
          borderRadius: BorderRadius.circular(borderRadius ?? AppValues.s10),
          border: hasBorder
              ? Border.all(color: AppColors.primaryGreen, width: AppValues.s2)
              : null,
        ),
        child: widget ??
            Text(
              title,
              style: getMediumStyle(
                fontSize: FontSize.s15,
                color: hasBorder ? AppColors.primaryGreen : AppColors.white,
              ),
            ),
      ),
    );
  }
}
