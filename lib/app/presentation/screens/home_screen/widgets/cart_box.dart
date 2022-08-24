import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/app/buisness_logic/cubits/login_cubit/login_cubit.dart';
import 'package:plant_app/app/core/constants/app_colors.dart';
import 'package:plant_app/app/core/constants/route_names.dart';

class CartBox extends StatelessWidget {
  const CartBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Implement cart screen
        /*BlocProvider.of<LoginCubit>(context).googleSignOut();
        Navigator.pushReplacementNamed(context, RouteNames.loginScreen);*/
        Navigator.pushNamed(context, RouteNames.cartScreen);
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(right: 14),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.primaryGreen,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SvgPicture.asset("assets/images/icons/Cart.svg"),
      ),
    );
  }
}
