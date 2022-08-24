import 'package:flutter/material.dart';

import '../../../../core/constants/api_strings.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/style_manager.dart';

class SearchedCardItem extends StatelessWidget {
  const SearchedCardItem(
      {Key? key,
      required this.imageUrl,
      required this.name,
      required this.description,
      this.price})
      : super(key: key);
  final String? imageUrl;
  final String name;
  final String description;
  final int? price;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.symmetric(horizontal: 26).copyWith(bottom: 21),
      elevation: 5,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 11)
                .copyWith(right: 23),
            child: Container(
              width: 100,
              height: 100,
              child: (imageUrl == "" || imageUrl == null)
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        "assets/images/p1.png",
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        baseUrl + imageUrl!,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 160,
                child: Text(
                  name,
                  style: getSemiBoldStyle(
                    color: AppColors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 170,
                child: Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: getMediumStyle(
                    color: AppColors.darkGrey,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                price == null ? "" : "$price EGP",
                style: getMediumStyle(
                  color: AppColors.primaryGreen,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
