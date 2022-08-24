import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_app/app/buisness_logic/cubits/login_cubit/login_cubit.dart';
import 'package:plant_app/app/buisness_logic/cubits/signup_cubit/signup_cubit.dart';
import 'package:plant_app/app/core/constants/route_names.dart';
import 'package:plant_app/app/presentation/widgets/custom_text_field.dart';
import 'package:plant_app/app/presentation/widgets/cutom_loading_spinner.dart';

import '../../../../core/constants/values_manager.dart';
import '../../../widgets/custom_button.dart';
import 'separator.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SignupCubit>(context);
    return BlocListener<SignupCubit, SignupState>(
  listener: (context, state) {
    if(state is SignupSuccess){
      Navigator.pushNamed(context, RouteNames.bottomNavBarScreen);
    }
  },
  child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 5),
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width*0.5-25,
                child: CustomTextField(
                  title: "First Name",
                  textEditingController: cubit.firstNameController,
                ),
              ),
              const SizedBox(height: AppValues.s25),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.5-25,
                child: CustomTextField(
                  title: "Last Name",
                  textEditingController: cubit.lastNameController,
                ),
              ),
            ],
          ),

          const SizedBox(height: AppValues.s20),
          CustomTextField(
            title: "Email",
            textEditingController: cubit.emailController,
          ),
          const SizedBox(height: AppValues.s20),
          CustomTextField(
            title: "Password",
            textEditingController: cubit.passwordController,
          ),
          const SizedBox(height: AppValues.s20),
          CustomTextField(
            title: "Confirm Password",
            textEditingController: cubit.confirmPasswordController,
          ),
          const SizedBox(height: AppValues.s20),
          BlocBuilder<SignupCubit, SignupState>(
            builder: (context, state) {
              if(state is SignupLoading){
                return CustomLoadingSpinner();
              }
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8,).copyWith(
                    bottom: 8),
                child: CustomButton(
                  onTap: () {
                    cubit.createUserAccount(cubit.firstNameController.text,
                      cubit.lastNameController.text,
                      cubit.emailController.text,
                      cubit.passwordController.text,);
                  },
                  title: "Sign Up",
                  hasBorder: false,
                  borderRadius: 5,
                ),
              );

            },
          ),
          const SizedBox(height: AppValues.s20),
          separator(),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  //googleSignin();
                  //GoogleSignIn().signOut();
                  BlocProvider.of<LoginCubit>(context).googleSignin();
                  // cubit.googleSignOut();
                },
                child: SvgPicture.asset("assets/images/icons/Google.svg"),
              ),
              const SizedBox(width: 40),
              GestureDetector(
                onTap: () {

                  //FacebookAuth.instance.logOut();
                  BlocProvider.of<LoginCubit>(context).loginWithFacebook();
                },
                child: SvgPicture.asset("assets/images/icons/Facebook.svg"),
              ),
            ],
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              child: Image.asset(
                "assets/images/bottom-plant.png",
                height: 90,
                width: 90,
              ),
            ),
          ),
        ],
      ),
    ),
);
  }
}
