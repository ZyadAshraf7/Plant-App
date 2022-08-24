import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:plant_app/app/buisness_logic/cubits/login_cubit/login_cubit.dart';
import 'package:plant_app/app/buisness_logic/cubits/login_cubit/login_cubit.dart';
import 'package:plant_app/app/core/constants/app_colors.dart';
import 'package:plant_app/app/core/constants/route_names.dart';
import 'package:plant_app/app/core/constants/style_manager.dart';
import 'package:plant_app/app/core/constants/values_manager.dart';
import 'package:plant_app/app/presentation/screens/authentication_screen/widgets/login_body.dart';
import 'package:plant_app/app/presentation/screens/authentication_screen/widgets/signup_body.dart';
import 'package:plant_app/app/presentation/widgets/custom_button.dart';
import 'package:plant_app/app/presentation/widgets/custom_text_field.dart';
import './widgets/separator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is GoogleSignInSuccess || state is LoginSuccess||state is FacebookLoginSuccess) {
            Navigator.of(context).pushNamed(RouteNames.bottomNavBarScreen);
          }
        },
        child: Column(
          children: [
            Container(
              alignment: Alignment.topRight,
              child: Image.asset(
                "assets/images/top-plant.png",
                height: 90,
                width: 90,
              ),
            ),
            Image.asset("assets/images/logo.png",height: 80,),
            //const SizedBox(height: AppValues.s35),
            SizedBox(
              height: 30,
              width: double.infinity,
              child: TabBar(
                indicatorColor: AppColors.primaryGreen,
                indicatorSize:TabBarIndicatorSize.label ,
                labelColor: AppColors.primaryGreen,
                unselectedLabelColor: AppColors.darkGrey,
                controller: tabController,
                tabs: const [
                  Tab(text: "Login",),
                  Tab(
                    text: "Sign up",
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppValues.s25),
            Flexible(
              child: TabBarView(
                controller: tabController,
                children: const [
                 LoginBody(),
                  SignupBody(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
