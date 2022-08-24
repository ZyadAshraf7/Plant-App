import 'package:flutter/material.dart';
import 'package:plant_app/app/core/constants/app_colors.dart';
import 'package:plant_app/app/core/constants/fonts_manager.dart';
import 'package:plant_app/app/core/constants/style_manager.dart';

Widget separator() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 2,
        width: 80,
        color: AppColors.heavyLightGrey,
      ),
      const SizedBox(width: 5),
      Text(
        "or continue with",
        style: getRegularStyle(fontSize: FontSize.s12,color: AppColors.heavyLightGrey)
      ),
      const SizedBox(width: 5),
      Container(
        height: 2,
        width: 80,
        color: AppColors.heavyLightGrey,
      ),
    ],
  );
}