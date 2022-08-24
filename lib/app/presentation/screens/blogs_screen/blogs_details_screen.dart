import 'package:flutter/material.dart';

import '../../../core/constants/api_strings.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/style_manager.dart';

class BlogsDetailsScreeen extends StatelessWidget {
  const BlogsDetailsScreeen(
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            (imageUrl == "" || imageUrl == null)
                ? Container(
                    width: size.width,
                    height: size.height * 0.4,
                    child: Image.asset(
                      "assets/images/p1.png",
                      fit: BoxFit.cover,
                    ),
                  )
                : Container(
                    width: size.width,
                    height: size.height * 0.4,
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
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
              width: size.width,
              height: size.height * 0.6,
              color: Colors.white,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
