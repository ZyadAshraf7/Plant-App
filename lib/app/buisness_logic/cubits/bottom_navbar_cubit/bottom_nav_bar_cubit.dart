import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:plant_app/app/presentation/screens/blogs_screen/blogs_screen.dart';
import 'package:plant_app/app/presentation/screens/notification_screen/notification_screen.dart';
import 'package:plant_app/app/presentation/screens/scanner_screen/scanner_screen.dart';
import 'package:plant_app/app/presentation/screens/search_screen/search_screen.dart';

import '../../../presentation/screens/home_screen/home_screen.dart';
import '../../../presentation/screens/profile_screen/profile_screen.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarInitial());

  int currentIndex = 2;

  List<Widget> screens = [
    BlogsScreen(),
    ScannerScreen(),
    HomeScreen(),
    NotificationsScreen(),
    ProfileScreen(),
  ];

  void navigateScreens(int index) {
    currentIndex = index;
    emit(NavBarChangeScreenState());
  }
}
