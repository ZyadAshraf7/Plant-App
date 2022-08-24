import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_app/app/buisness_logic/cubits/fetch_plants_cubit/fetch_plants_cubit.dart';
import 'package:plant_app/app/buisness_logic/cubits/fetch_plants_cubit/fetch_plants_cubit.dart';
import 'package:plant_app/app/core/constants/api_strings.dart';
import 'package:plant_app/app/core/constants/app_colors.dart';
import 'package:plant_app/app/core/constants/style_manager.dart';
import 'package:plant_app/app/data/models/plant.dart';
import 'package:plant_app/app/presentation/widgets/custom_button.dart';
import 'package:plant_app/app/presentation/widgets/cutom_loading_spinner.dart';

class PlantCard extends StatelessWidget {
  const PlantCard({
    Key? key,
    this.name,
    this.imageUrl,
    this.price,
    this.quantity,
    required this.id,
    this.incrementQuantity,
    this.decrementQuantity,
    required this.addToCart,
  }) : super(key: key);
  final String id;
  final String? name;
  final String? imageUrl;
  final String? price;
  final int? quantity;
  final VoidCallback? incrementQuantity;
  final VoidCallback? decrementQuantity;
  final void Function() addToCart;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Container(
            alignment: Alignment.bottomCenter,
            height: 300,
            child: Container(
              height: 220,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.17),
                  blurRadius: 4,
                )
              ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      //"GARDENIA PLANT",
                      name ?? "",
                      style: getBoldStyle(
                        fontSize: 16,
                        color: AppColors.black,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Text(
                      price == "" || price == null ? "100 EGP" : "$price EGP",
                      style: getBoldStyle(
                        fontSize: 12,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomButton(
                      margin: EdgeInsets.all(0),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 21, vertical: 10),
                      onTap: addToCart,
                      title: "Add To Cart",
                      hasBorder: false,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 25,
          right: 75,
          child: (imageUrl == "" || imageUrl == null)
              ? Container(
                  height: 134,
                  width: 82,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      "assets/images/p1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : SizedBox(
                  height: 134,
                  width: 82,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      baseUrl + imageUrl!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
        ),
        Positioned(
          bottom: 150,
          right: 10,
          child: Row(
            children: [
              GestureDetector(
                onTap: decrementQuantity,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  color: AppColors.lightGrey,
                  child: Text(
                    "-",
                      style: TextStyle(
                          color: AppColors.heavyLightGrey, fontSize: 18)),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                quantity.toString(),
                style: getBoldStyle(color: Colors.black),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: incrementQuantity,
                /*() {
                      BlocProvider.of<FetchPlantsCubit>(context)
                          .incrementQuantity(id);
                    },*/
                child: Container(
                    color: AppColors.lightGrey,
                    child: const Icon(
                      Icons.add,
                      color: AppColors.heavyLightGrey,
                      size: 18,
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
