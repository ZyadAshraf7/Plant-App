import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/app/buisness_logic/cubits/fetch_tools_cubit/fetch_tools_cubit.dart';
import 'package:toast/toast.dart';
import '../../../buisness_logic/cubits/cart_cubit/cart_cubit.dart';
import '../../../data/models/cart.dart';
import '../../widgets/cutom_loading_spinner.dart';
import '../../widgets/plant_card.dart';
import '../product_details_screen/product_details_screen.dart';

class ToolsBody extends StatelessWidget {
  const ToolsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FetchToolsCubit>(context);
    ToastContext().init(context);

    return BlocBuilder<FetchToolsCubit, FetchToolsState>(
      builder: (context, state) {
        if (state is FetchToolsLoading) {
          return const CustomLoadingSpinner();
        }
        return GridView.builder(
          shrinkWrap: true,
          //physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 17).copyWith(bottom: 60),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.6, crossAxisSpacing: 12),
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetailsScreen(
                      name: cubit.toolsList[i].name!,
                      imageUrl: cubit.toolsList[i].imageUrl!,
                      description: cubit.toolsList[i].description!,
                    ),
                  ),
                );
              },
              child: PlantCard(
                id: cubit.toolsList[i].toolId!,
                name: cubit.toolsList[i].name,
                imageUrl: cubit.toolsList[i].imageUrl,
                quantity: cubit.toolsList[i].quantity,
                incrementQuantity: ()=>cubit.incrementQuantity(cubit.toolsList[i].toolId!),
                decrementQuantity: ()=>cubit.decrementQuantity(cubit.toolsList[i].toolId!),
                addToCart: () {
                  BlocProvider.of<CartCubit>(context).addProductToCart(
                    Cart(
                      id: cubit.toolsList[i].toolId!,
                      name: cubit.toolsList[i].name,
                      imageUrl: cubit.toolsList[i].imageUrl,
                      quantity: cubit.toolsList[i].quantity,
                      price: 100,
                    ),
                  );
                  print("added");
                  Toast.show("Added to the cart", duration: Toast.lengthShort, gravity:  Toast.bottom);

                },
              ),
            );
          },
          itemCount: cubit.toolsList.length,
        );
      },
    );
  }
}
