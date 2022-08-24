import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/app/core/constants/app_colors.dart';
import 'package:plant_app/app/core/constants/style_manager.dart';
import 'package:plant_app/app/core/constants/values_manager.dart';
import 'package:plant_app/app/data/repositories/fetch_plants_repository.dart';

import '../../../../buisness_logic/cubits/login_cubit/login_cubit.dart';
import '../../../../core/constants/route_names.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // TODO: Implement search screen
        //FetchPlantsRepository.fetchPlants();

        Navigator.pushNamed(context, RouteNames.searchScreen);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 14),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 27),
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(AppValues.s10),
        ),
        child: Row(
          children: [
            SvgPicture.asset("assets/images/icons/Search.svg"),
            const SizedBox(width: 14),
            Text(
              "Search",
              style: getRegularStyle(
                color: AppColors.heavyLightGrey,
                fontSize: 16
              ),
            ),
          ],
        ),
      ),
    );
  }
}
