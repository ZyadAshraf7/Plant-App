import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/app/buisness_logic/cubits/add_new_post_cubit/add_new_post_cubit.dart';
import 'package:plant_app/app/buisness_logic/cubits/bottom_navbar_cubit/bottom_nav_bar_cubit.dart';
import 'package:plant_app/app/buisness_logic/cubits/fetch_all_forms_cubit/fetch_all_forms_cubit.dart';
import 'package:plant_app/app/buisness_logic/cubits/fetch_my_forums_cubit/fetch_my_forums_cubit.dart';
import 'package:plant_app/app/buisness_logic/cubits/fetch_plants_cubit/fetch_plants_cubit.dart';
import 'package:plant_app/app/buisness_logic/cubits/login_cubit/login_cubit.dart';
import 'package:plant_app/app/core/constants/route_names.dart';
import 'package:plant_app/app/data/repositories/create_new_post_repository.dart';
import 'package:plant_app/app/data/repositories/fetch_my_formus_repository.dart';
import 'package:plant_app/app/data/repositories/fetch_plants_repository.dart';
import 'package:plant_app/app/data/repositories/login_repository.dart';
import 'package:plant_app/app/data/repositories/signup_repository.dart';
import 'package:plant_app/app/presentation/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:plant_app/app/presentation/screens/cart_screen/cart_screen.dart';
import 'package:plant_app/app/presentation/screens/discussion_forums/add_new_post_screen.dart';
import 'package:plant_app/app/presentation/screens/discussion_forums/discussion_forums.dart';
import 'package:plant_app/app/presentation/screens/home_screen/home_screen.dart';
import 'package:plant_app/app/presentation/screens/product_details_screen/product_details_screen.dart';
import 'package:plant_app/app/presentation/screens/search_screen/search_screen.dart';

import '../../data/repositories/fetch_all_forums_repository.dart';
import '../screens/authentication_screen/login_screen.dart';

class AppRouter {
  late SignupRepository signupRepository;
  late LoginRepository loginRepository;

  void initAppSettings() {
    signupRepository = SignupRepository();
    loginRepository = LoginRepository();
  }

  Route? onGenerateRoutes(RouteSettings settings) {
    initAppSettings();
    switch (settings.name) {
      case RouteNames.bottomNavBarScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => BottomNavBarCubit(),
              ),
            ],
            child: const BottomNavBarScreen(),
          ),
        );
      case RouteNames.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );

      case RouteNames.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case RouteNames.cartScreen:
        return MaterialPageRoute(
          builder: (_) => const CartScreen(),
        );
      case RouteNames.searchScreen:
        return MaterialPageRoute(
          builder: (_) => const SearchScreen(),
        );
      case RouteNames.addNewPostScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AddNewPostCubit(
              createNewPostRepository: CreateNewPostRepository(),
            ),
            child: AddNewPostScreen(),
          ),
        );
      case RouteNames.discussionForumsScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => FetchMyForumsCubit(
                  fetchMyForumsRepository: FetchMyForumsRepository(),
                ),
              ),
            ],
            child: DiscussionForums(),
          ),
        );
      default:
        null;
    }
    return null;
  }
}
