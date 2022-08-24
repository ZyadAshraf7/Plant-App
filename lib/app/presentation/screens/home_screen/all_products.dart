import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/app/buisness_logic/cubits/fetch_products_cubit/fetch_products_cubit.dart';
import 'package:toast/toast.dart';

import '../../../buisness_logic/cubits/cart_cubit/cart_cubit.dart';
import '../../../data/models/cart.dart';
import '../../widgets/cutom_loading_spinner.dart';
import '../../widgets/plant_card.dart';
import '../product_details_screen/product_details_screen.dart';

class AllProductsBody extends StatelessWidget {
  const AllProductsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    final cubit = BlocProvider.of<FetchProductsCubit>(context);

    return BlocBuilder<FetchProductsCubit, FetchProductsState>(
      builder: (context, state) {
        if (state is FetchProductsLoading) {
          return CustomLoadingSpinner();
        }
        return GridView.builder(
          shrinkWrap: true,
          //physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 17).copyWith(bottom: 60),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.6, crossAxisSpacing: 12),
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetailsScreen(
                      name: cubit.productsList[i].name!,
                      imageUrl: cubit.productsList[i].imageUrl!,
                      description: cubit.productsList[i].description!,
                      sunLight: cubit.productsList[i].plant?.sunLight.toString()??"",
                      waterCapacity: cubit.productsList[i].plant?.waterCapacity.toString()??"",
                      temprature: cubit.productsList[i].plant?.temperature.toString()??"",
                    ),
                  ),
                );
              },
              child: PlantCard(
                id: cubit.productsList[i].productId!,
                name: cubit.productsList[i].name,
                price: cubit.productsList[i].price.toString(),
                imageUrl: cubit.productsList[i].imageUrl,
                quantity: cubit.productsList[i].quantity,
                incrementQuantity: () =>
                    cubit.incrementQuantity(cubit.productsList[i].productId!),
                decrementQuantity: () =>
                    cubit.decrementQuantity(cubit.productsList[i].productId!),
                addToCart: () {
                  BlocProvider.of<CartCubit>(context).addProductToCart(
                    Cart(
                      id: cubit.productsList[i].productId!,
                      name: cubit.productsList[i].name,
                      imageUrl: cubit.productsList[i].imageUrl,
                      quantity: cubit.productsList[i].quantity,
                      price: cubit.productsList[i].price,
                    ),
                  );
                  print("added");
                  Toast.show("Added to the cart", duration: Toast.lengthShort, gravity:  Toast.bottom);
                },
              ),
            );
          },
          itemCount: cubit.productsList.length,
        );
      },
    );
  }
}
