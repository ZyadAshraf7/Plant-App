import 'package:flutter/material.dart';
import 'package:plant_app/app/core/constants/app_colors.dart';

class CustomLoadingSpinner extends StatelessWidget {
  const CustomLoadingSpinner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.primaryGreen,
      ),
    );
  }
}
