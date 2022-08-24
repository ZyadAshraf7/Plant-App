import 'package:flutter/material.dart';
import 'package:plant_app/app/presentation/screens/home_screen/all_products.dart';
import 'package:plant_app/app/presentation/screens/home_screen/plants_body.dart';
import 'package:plant_app/app/presentation/screens/home_screen/seeds_body.dart';
import 'package:plant_app/app/presentation/screens/home_screen/tools_body.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/style_manager.dart';
import '../../../../core/constants/values_manager.dart';
import 'category_box.dart';

class TabBarCategories extends StatelessWidget {
  const TabBarCategories({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 35,
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.primaryGreen)),
            isScrollable: true,
            labelColor: AppColors.primaryGreen,
            labelStyle: getMediumStyle(
                color: AppColors.primaryGreen, fontSize: 16),
            unselectedLabelStyle:
            getRegularStyle(color: AppColors.heavyLightGrey),
            unselectedLabelColor: AppColors.heavyLightGrey,
            controller: tabController,
            tabs: 
            [
              CategoryBox(title: "All",index: 0, currentIndex: tabController.index),
              CategoryBox(title: "Plants",index: 1, currentIndex: tabController.index),
              CategoryBox(title: "Seeds",index: 2, currentIndex: tabController.index),
              CategoryBox(title: "Tools",index: 3, currentIndex: tabController.index),
            ],
          ),
        ),
        const SizedBox(height: AppValues.s25),

      ],
    );

  }
}
