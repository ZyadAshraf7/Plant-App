import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/app/buisness_logic/cubits/cart_cubit/cart_cubit.dart';
import 'package:plant_app/app/buisness_logic/cubits/fetch_all_forms_cubit/fetch_all_forms_cubit.dart';
import 'package:plant_app/app/buisness_logic/cubits/fetch_products_cubit/fetch_products_cubit.dart';
import 'package:plant_app/app/buisness_logic/cubits/fetch_seeds_cubit/fetch_seeds_cubit.dart';
import 'package:plant_app/app/buisness_logic/cubits/fetch_tools_cubit/fetch_tools_cubit.dart';
import 'package:plant_app/app/buisness_logic/cubits/get_user_data_cubit/get_user_data_cubit.dart';
import 'package:plant_app/app/buisness_logic/cubits/login_cubit/login_cubit.dart';
import 'package:plant_app/app/buisness_logic/cubits/signup_cubit/signup_cubit.dart';
import 'package:plant_app/app/core/constants/route_names.dart';
import 'package:plant_app/app/core/theme/app_theme.dart';
import 'package:plant_app/app/data/repositories/fetch_blogs_repository.dart';
import 'package:plant_app/app/data/repositories/fetch_seeds.dart';
import 'package:plant_app/app/data/repositories/fetch_tools_repositories.dart';
import 'package:plant_app/app/data/repositories/get_user_data_repository.dart';
import 'package:plant_app/app/data/repositories/signup_repository.dart';
import 'package:plant_app/app/data/shared_preference/user_preference.dart';
import 'package:toast/toast.dart';

import 'buisness_logic/cubits/fetch_blogs_cubit/fetch_blogs_cubit.dart';
import 'buisness_logic/cubits/fetch_plants_cubit/fetch_plants_cubit.dart';
import 'data/repositories/fetch_all_forums_repository.dart';
import 'data/repositories/fetch_plants_repository.dart';
import 'data/repositories/fetch_products_repository.dart';
import 'data/repositories/login_repository.dart';
import 'presentation/routing/app_router.dart';

class PlantApp extends StatelessWidget {
  const PlantApp({Key? key, this.appRouter, this.initialRoute})
      : super(key: key);
  final AppRouter? appRouter;
  final String? initialRoute;

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(loginRepository: LoginRepository()),
        ),
        BlocProvider(
          create: (context) => SignupCubit(
            signupRepository: SignupRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => FetchPlantsCubit(
            fetchPlantsRepository: FetchPlantsRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => FetchSeedsCubit(
            seedsRepository: SeedsRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => FetchToolsCubit(
            toolsRepository: ToolsRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
        BlocProvider(
          create: (context) => FetchProductsCubit(
            productsRepository: ProductsRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => GetUserDataCubit(
            getUserDataRepository: GetUserDataRepository(),
          )..fetchUserData(),
        ),
        BlocProvider(
          create: (context) => FetchBlogsCubit(
            fetchBlogsRepository: FetchBlogsRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => FetchAllFormsCubit(
            fetchAllForumsRepository: FetchAllForumsRepository(),
          ),
        ),
       /* BlocProvider(
          create: (context) => FetchAllFormsCubit(
            fetchAllForumsRepository: FetchAllForumsRepository(),
          )..fetchAllForums(),
        ),*/
      ],
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: MaterialApp(
          theme: AppTheme.appThemeMode,
          debugShowCheckedModeBanner: false,
          initialRoute: UserPreferences.getUserToken()==""?RouteNames.loginScreen:RouteNames.bottomNavBarScreen,
          onGenerateRoute: appRouter!.onGenerateRoutes,
        ),
      ),
    );
  }
}
