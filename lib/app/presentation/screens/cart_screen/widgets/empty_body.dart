import 'package:flutter/material.dart';
import 'package:plant_app/app/core/constants/app_colors.dart';

import '../../../../core/constants/style_manager.dart';

class EmptyBody extends StatelessWidget {
  const EmptyBody({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/empty.png"),
          SizedBox(
            height: 40,
          ),
          Text(
            title,
            style: getBoldStyle(color: Colors.black, fontSize: 24),
          ),
          SizedBox(height: 20,),
          SizedBox(
            width: 300,
            child: Text(
              "Sorry, the keyword you entered cannot be found, please check again or search with another keyword.",
              style: getMediumStyle(
                color: AppColors.heavyLightGrey,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
