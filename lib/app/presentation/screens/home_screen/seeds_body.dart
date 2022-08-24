import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/app/buisness_logic/cubits/fetch_seeds_cubit/fetch_seeds_cubit.dart';
import 'package:toast/toast.dart';

import '../../../buisness_logic/cubits/cart_cubit/cart_cubit.dart';
import '../../../data/models/cart.dart';
import '../../widgets/cutom_loading_spinner.dart';
import '../../widgets/plant_card.dart';
import '../product_details_screen/product_details_screen.dart';

class SeedsBody extends StatelessWidget {
  const SeedsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FetchSeedsCubit>(context);
    ToastContext().init(context);

    return BlocBuilder<FetchSeedsCubit, FetchSeedsState>(
      builder: (context, state) {
        if (state is FetchSeedsLoading) {
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
                      name: cubit.seedsList[i].name!,
                      imageUrl: cubit.seedsList[i].imageUrl!,
                      description: cubit.seedsList[i].description!,
                    ),
                  ),
                );
              },
              child: PlantCard(
                id: cubit.seedsList[i].seedId!,
                name: cubit.seedsList[i].name,
                imageUrl: cubit.seedsList[i].imageUrl,
                quantity:cubit.seedsList[i].quantity,
                incrementQuantity: ()=>cubit.incrementQuantity(cubit.seedsList[i].seedId!),
                decrementQuantity: ()=>cubit.decrementQuantity(cubit.seedsList[i].seedId!),
                addToCart: () {
                  BlocProvider.of<CartCubit>(context).addProductToCart(
                    Cart(
                      id: cubit.seedsList[i].seedId!,
                      name: cubit.seedsList[i].name,
                      imageUrl: cubit.seedsList[i].imageUrl,
                      quantity: cubit.seedsList[i].quantity,
                      price: 100,
                    ),
                  );
                  print("added");
                  Toast.show("Added to the cart", duration: Toast.lengthShort, gravity:  Toast.bottom);

                },
              ),
            );
          },
          itemCount: cubit.seedsList.length,
        );
      },
    );
  }
}
