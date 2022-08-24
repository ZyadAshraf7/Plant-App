import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/app/buisness_logic/cubits/cart_cubit/cart_cubit.dart';
import 'package:plant_app/app/buisness_logic/cubits/cart_cubit/cart_cubit.dart';
import 'package:plant_app/app/core/constants/app_colors.dart';
import 'package:plant_app/app/core/constants/style_manager.dart';
import 'package:plant_app/app/presentation/screens/cart_screen/widgets/cart_item_box.dart';
import 'package:plant_app/app/presentation/screens/cart_screen/widgets/empty_body.dart';
import 'package:plant_app/app/presentation/screens/home_screen/widgets/cart_box.dart';
import 'package:plant_app/app/presentation/widgets/custom_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CartCubit>(context);
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(
              "My Cart",
              style: getSemiBoldStyle(color: AppColors.black, fontSize: 18),
            ),
          ),
          body: cubit.cartItems.isEmpty?EmptyBody(title: "Your cart is empty",):SingleChildScrollView(
            //physics: NeverScrollableScrollPhysics(),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.88,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 80),
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      return CartItemBox(
                        cartItem: cubit.cartItems[i],
                      );
                    },
                    itemCount: cubit.cartItems.length,
                  ),
                ),
                Container(
                  color: Colors.white,
                  //margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 24).copyWith(top: 10),
                  //alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: getBoldStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "${cubit.calculateTotalPrice()} EGP",
                            style: getBoldStyle(color: AppColors.primaryGreen,fontSize: 20),
                          ),
                        ],
                      ),
                      SizedBox(height: 14),
                      CustomButton(onTap: (){}, title: "Checkout", hasBorder: false,margin: EdgeInsets.zero,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
