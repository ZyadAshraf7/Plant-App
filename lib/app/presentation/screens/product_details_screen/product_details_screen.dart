import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_app/app/core/constants/app_colors.dart';
import 'package:plant_app/app/presentation/screens/product_details_screen/widgets/plant_information_box.dart';

import '../../../core/constants/api_strings.dart';
import '../../../core/constants/style_manager.dart';
import '../../widgets/custom_button.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen(
      {Key? key,
      required this.name,
      required this.description,
      required this.imageUrl,
      this.temprature,
      this.sunLight,
      this.waterCapacity})
      : super(key: key);
  final String name;
  final String description;
  final String imageUrl;
  final String? temprature;
  final String? sunLight;
  final String? waterCapacity;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            child: Stack(
              children: [
                (imageUrl == "" || imageUrl == null)
                    ? Stack(
                      children: [
                        Image.asset("assets/images/p1.png"),
                        Container(
                          color: Colors.black.withOpacity(0.5),
                        )
                      ],
                    )
                    : Stack(
                        children: [
                          Container(
                            width: size.width,
                            height: size.height * 0.5,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  baseUrl + imageUrl,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.black.withOpacity(0.5),
                          )
                        ],
                      ),
                (sunLight == null||sunLight == "")
                    ? SizedBox()
                    : PlantInformationBox(
                        sunLight: sunLight,
                        temprature: temprature,
                        waterCapacity: waterCapacity,
                      )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                height: size.height * 0.5 + 20,
                width: size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style:
                          getSemiBoldStyle(color: Colors.black, fontSize: 20),
                    ),
                    SizedBox(height: 18),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.heavyLightGrey,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Spacer(),
                    CustomButton(
                      onTap: () {},
                      title: "Go To Blog",
                      hasBorder: false,
                      margin: EdgeInsets.zero,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
