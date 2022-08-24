import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/app/buisness_logic/cubits/cart_cubit/cart_cubit.dart';
import 'package:plant_app/app/buisness_logic/cubits/cart_cubit/cart_cubit.dart';
import 'package:plant_app/app/core/constants/api_strings.dart';
import 'package:plant_app/app/core/constants/app_colors.dart';
import 'package:plant_app/app/core/constants/style_manager.dart';
import 'package:plant_app/app/data/models/cart.dart';

class CartItemBox extends StatelessWidget {
  const CartItemBox({Key? key, required this.cartItem}) : super(key: key);
  final Cart cartItem;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CartCubit>(context);
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          margin: EdgeInsets.symmetric(horizontal: 26).copyWith(bottom: 21),
          elevation: 5,
          child: Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 11)
                        .copyWith(right: 23),
                child: Container(
                  width: 100,
                  height: 100,
                  child: (cartItem.imageUrl == "" || cartItem.imageUrl == null)
                      ? Image.asset("assets/images/p1.png")
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(
                            baseUrl + cartItem.imageUrl!,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 160,
                    child: Text(
                      cartItem.name!,
                      style: getSemiBoldStyle(
                        color: AppColors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "${cartItem.price!} EGP",
                    style: getMediumStyle(
                      color: AppColors.primaryGreen,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 19),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                final item =
                                    cubit.findProductbyId(cartItem.id!);
                                cubit.decrementQuantity(cartItem.id!);
                              },
                              child: Text(
                                "-",
                                style: getMediumStyle(
                                  color: AppColors.primaryGreen,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            SizedBox(width: 14),
                            Text(
                              "${cartItem.quantity!}",
                              style: getMediumStyle(
                                color: AppColors.primaryGreen,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(width: 14),
                            GestureDetector(
                              onTap: () {
                                cubit.incrementQuantity(cartItem.id!);
                              },
                              child: Text(
                                "+",
                                style: getMediumStyle(
                                  color: AppColors.primaryGreen,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 50),
                      IconButton(
                        onPressed: () {
                          cubit.removeProductFromCart(cartItem);
                        },
                        icon: Icon(
                          Icons.delete,
                        color: AppColors.primaryGreen,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
