import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/app/buisness_logic/cubits/cart_cubit/cart_cubit.dart';
import 'package:plant_app/app/data/models/cart.dart';
import 'package:toast/toast.dart';

import '../../../buisness_logic/cubits/fetch_plants_cubit/fetch_plants_cubit.dart';
import '../../widgets/cutom_loading_spinner.dart';
import '../../widgets/plant_card.dart';
import '../product_details_screen/product_details_screen.dart';

class PlantsBody extends StatelessWidget {
  const PlantsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FetchPlantsCubit>(context);
    ToastContext().init(context);

    return BlocBuilder<FetchPlantsCubit, FetchPlantsState>(
      builder: (context, state) {
        if (state is FetchPlantsLoading) {
          return CustomLoadingSpinner();
        }
        return GridView.builder(
          shrinkWrap: true,
          //physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 17).copyWith(bottom: 60),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.6, crossAxisSpacing: 12),
          itemBuilder: (context, i) {
            final plant =
                cubit.findProductbyId(cubit.plantsProducts[i].plantId!);
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetailsScreen(
                      name: cubit.plantsProducts[i].name!,
                      imageUrl: cubit.plantsProducts[i].imageUrl!,
                      description: cubit.plantsProducts[i].description!,
                      sunLight: cubit.plantsProducts[i].sunLight.toString(),
                      waterCapacity: cubit.plantsProducts[i].waterCapacity.toString(),
                      temprature: cubit.plantsProducts[i].temperature.toString(),
                    ),
                  ),
                );
              },
              child: PlantCard(
                id: cubit.plantsProducts[i].plantId!,
                name: cubit.plantsProducts[i].name,
                imageUrl: cubit.plantsProducts[i].imageUrl,
                quantity: cubit.plantsProducts[i].quantity,
                incrementQuantity: () =>
                    cubit.incrementQuantity(cubit.plantsProducts[i].plantId!),
                decrementQuantity: () =>
                    cubit.decrementQuantity(cubit.plantsProducts[i].plantId!),
                addToCart: () {
                  BlocProvider.of<CartCubit>(context).addProductToCart(
                        Cart(
                          id: cubit.plantsProducts[i].plantId!,
                          name: cubit.plantsProducts[i].name,
                          imageUrl: cubit.plantsProducts[i].imageUrl,
                          quantity: cubit.plantsProducts[i].quantity,
                          price: 100,
                        ),
                      );
                  print("added");
                  Toast.show("Added to the cart", duration: Toast.lengthShort, gravity:  Toast.bottom);

                },
              ),
            );
          },
          itemCount: cubit.plantsProducts.length,
        );
      },
    );
  }
}
