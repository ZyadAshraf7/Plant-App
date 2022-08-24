import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/app/buisness_logic/cubits/fetch_plants_cubit/fetch_plants_cubit.dart';
import 'package:plant_app/app/buisness_logic/cubits/login_cubit/login_cubit.dart';
import 'package:plant_app/app/core/constants/route_names.dart';
import 'package:plant_app/app/data/repositories/fetch_plants_repository.dart';
import 'package:plant_app/app/presentation/screens/home_screen/plants_body.dart';
import 'package:plant_app/app/presentation/screens/home_screen/seeds_body.dart';
import 'package:plant_app/app/presentation/screens/home_screen/widgets/cart_box.dart';
import 'package:plant_app/app/presentation/screens/home_screen/widgets/search_box.dart';
import 'package:plant_app/app/presentation/screens/home_screen/widgets/tab_bar_categories.dart';
import 'package:plant_app/app/presentation/widgets/cutom_loading_spinner.dart';
import 'package:plant_app/app/presentation/widgets/plant_card.dart';

import 'all_products.dart';
import 'tools_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final bool selected = false;
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });

    super.initState();
    //FetchPlantsRepository.fetchPlants();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Image.asset("assets/images/logo.png"),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Expanded(child: SearchBox()),
                  CartBox(),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              TabBarCategories(tabController: tabController),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    AllProductsBody(),
                    PlantsBody(),
                    SeedsBody(),
                    ToolsBody(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
