import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/app/buisness_logic/cubits/fetch_all_forms_cubit/fetch_all_forms_cubit.dart';
import 'package:plant_app/app/buisness_logic/cubits/fetch_my_forums_cubit/fetch_my_forums_cubit.dart';
import 'package:plant_app/app/core/constants/route_names.dart';
import 'package:plant_app/app/core/constants/style_manager.dart';
import 'package:plant_app/app/presentation/screens/discussion_forums/widgets/all_forums_body.dart';
import 'package:plant_app/app/presentation/screens/discussion_forums/widgets/forums_tab_bar.dart';
import 'package:plant_app/app/presentation/screens/discussion_forums/widgets/my_forums_body.dart';
import 'package:plant_app/app/presentation/screens/home_screen/widgets/search_box.dart';
import 'package:plant_app/app/presentation/widgets/cutom_loading_spinner.dart';

import '../../../core/constants/app_colors.dart';
import '../home_screen/widgets/category_box.dart';

class DiscussionForums extends StatefulWidget {
  const DiscussionForums({Key? key}) : super(key: key);

  @override
  State<DiscussionForums> createState() => _DiscussionForumsState();
}

class _DiscussionForumsState extends State<DiscussionForums>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    if (BlocProvider.of<FetchAllFormsCubit>(context).allForums.isEmpty) {
      BlocProvider.of<FetchAllFormsCubit>(context).fetchAllForums();
    }
    if (BlocProvider.of<FetchMyForumsCubit>(context).myForums.isEmpty) {
      BlocProvider.of<FetchMyForumsCubit>(context).fetchMyForums();
    }
    super.initState();
    //FetchPlantsRepository.fetchPlants();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RouteNames.addNewPostScreen);
        },
        backgroundColor: AppColors.primaryGreen,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Discussion Forums",
          style: getBoldStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body: BlocBuilder<FetchAllFormsCubit, FetchAllFormsState>(
        builder: (context, state) {
          if (state is FetchAllFormsLoading) {
            return CustomLoadingSpinner();
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBox(),
              SizedBox(height: 20),
              ForumsTabBar(tabController: tabController),
              Expanded(
                child: TabBarView(
                  //physics: PageScrollPhysics(),
                  controller: tabController,
                  children: const [
                    AllForumsBody(),
                    MyForumsBody(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
