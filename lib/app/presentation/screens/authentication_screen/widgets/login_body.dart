import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_app/app/core/constants/route_names.dart';
import 'package:plant_app/app/presentation/widgets/cutom_loading_spinner.dart';

import '../../../../buisness_logic/cubits/login_cubit/login_cubit.dart';
import '../../../../core/constants/values_manager.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';
import '../widgets/separator.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LoginCubit>(context);
    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppValues.s25),
          child: CustomTextField(
              title: "Email",
              textEditingController: cubit.emaiController),
        ),
        const SizedBox(height: AppValues.s20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppValues.s25),
          child: CustomTextField(
              title: "Password",
              textEditingController: cubit.password),
        ),
        const SizedBox(height: AppValues.s25),
        BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            if(state is LoginLoading){
              return const CustomLoadingSpinner();
            }
            /*if(state is GoogleSignInSuccess){
              Navigator.of(context).pushNamed(RouteNames.bottomNavBarScreen);
            }*/
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: CustomButton(
                onTap: () {
                  cubit.loginUser(cubit.emaiController.text, cubit.password.text);
                },
                title: "Login",
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
                cubit.googleSignin();
                // cubit.googleSignOut();
              },
              child: SvgPicture.asset("assets/images/icons/Google.svg"),
            ),
            const SizedBox(width: 40),
            GestureDetector(
              onTap: () {

                 //FacebookAuth.instance.logOut();
                cubit.loginWithFacebook();
                // FacebookAuth.instance.logOut();
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
              height: 100,
              width: 115,
            ),
          ),
        ),
      ],
    );
  }
}
