import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_app/app/buisness_logic/cubits/bottom_navbar_cubit/bottom_nav_bar_cubit.dart';
import 'package:plant_app/app/buisness_logic/cubits/fetch_products_cubit/fetch_products_cubit.dart';
import 'package:plant_app/app/buisness_logic/cubits/fetch_seeds_cubit/fetch_seeds_cubit.dart';
import 'package:plant_app/app/buisness_logic/cubits/fetch_tools_cubit/fetch_tools_cubit.dart';
import 'package:plant_app/app/presentation/screens/bottom_nav_bar/widgets/bottom_navbar_item.dart';

import '../../../buisness_logic/cubits/fetch_plants_cubit/fetch_plants_cubit.dart';
import '../../../core/constants/app_colors.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  @override
  void initState() {
    if(BlocProvider.of<FetchPlantsCubit>(context).plantsProducts.isEmpty){
      BlocProvider.of<FetchPlantsCubit>(context).fetchPlants();
    }
    if(BlocProvider.of<FetchSeedsCubit>(context).seedsList.isEmpty){
      BlocProvider.of<FetchSeedsCubit>(context).fetchSeeds();
    }
    if(BlocProvider.of<FetchToolsCubit>(context).toolsList.isEmpty){
      BlocProvider.of<FetchToolsCubit>(context).fetchTools();
    }
    if(BlocProvider.of<FetchProductsCubit>(context).productsList.isEmpty){
      BlocProvider.of<FetchProductsCubit>(context).fetchProduct();
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<BottomNavBarCubit>(context);
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        return Scaffold(
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: Container(
            child: CurvedNavigationBar(
              height: 60,
              backgroundColor: AppColors.primaryGreen.withOpacity(0.3),
              onTap: cubit.navigateScreens,
              animationCurve: Curves.easeOut,
              animationDuration: const Duration(milliseconds: 300),
              buttonBackgroundColor: AppColors.primaryGreen,
              index: cubit.currentIndex,
              items: [
                //SvgPicture.asset("assets/images/icons/leave.svg"),
                BottomNavBarItem(
                  index: 0,
                  currentIndex: cubit.currentIndex,
                  iconPath: "assets/images/leave.png",),
                BottomNavBarItem(
                  index: 1,
                  currentIndex: cubit.currentIndex,
                  iconPath: "assets/images/qr-code.png",),
                BottomNavBarItem(
                  index: 2,
                  currentIndex: cubit.currentIndex,
                  iconPath: "assets/images/Home.png",),
                BottomNavBarItem(
                  index: 3,
                  currentIndex: cubit.currentIndex,
                  iconPath: "assets/images/Bell.png",),
                BottomNavBarItem(
                  index: 4,
                  currentIndex: cubit.currentIndex,
                  iconPath: "assets/images/profile.png",),
                //SvgPicture.asset("assets/images/icons/profile.svg"),
              ],
            ),
          ),
        );
      },
    );
  }
}
