import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/style_manager.dart';
import '../../home_screen/widgets/category_box.dart';

class ForumsTabBar extends StatelessWidget {
  const ForumsTabBar({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorSize: TabBarIndicatorSize.label,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      isScrollable: true,
      labelColor: AppColors.white,
      labelStyle:
      getMediumStyle(color: AppColors.primaryGreen, fontSize: 16),
      unselectedLabelStyle:
      getRegularStyle(color: AppColors.heavyLightGrey),
      unselectedLabelColor: AppColors.heavyLightGrey,
      controller: tabController,
      tabs: [
        CategoryBox(
          selectedColor: AppColors.primaryGreen,
          unSelectedColor: AppColors.white,
          borderRadius: 5,
          title: "All Forums",
          index: 0,
          currentIndex: tabController.index,
          hasBorder: true,
        ),
        CategoryBox(
          hasBorder: true,
          borderRadius: 5,
          selectedColor: AppColors.primaryGreen,
          unSelectedColor: AppColors.white,
          title: "My Forums",
          index: 1,
          currentIndex: tabController.index,
        )
      ],
    );
  }
}

