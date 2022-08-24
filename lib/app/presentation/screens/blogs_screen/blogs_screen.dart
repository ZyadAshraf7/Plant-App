import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/app/buisness_logic/cubits/fetch_blogs_cubit/fetch_blogs_cubit.dart';
import 'package:plant_app/app/buisness_logic/cubits/fetch_blogs_cubit/fetch_blogs_cubit.dart';
import 'package:plant_app/app/presentation/screens/search_screen/widgets/searched_card_item.dart';
import 'package:plant_app/app/presentation/widgets/cutom_loading_spinner.dart';

import '../../../core/constants/style_manager.dart';
import '../product_details_screen/product_details_screen.dart';
import 'blogs_details_screen.dart';

class BlogsScreen extends StatefulWidget {
  const BlogsScreen({Key? key}) : super(key: key);

  @override
  State<BlogsScreen> createState() => _BlogsScreenState();
}

class _BlogsScreenState extends State<BlogsScreen> {
  @override
  void initState() {
    BlocProvider.of<FetchBlogsCubit>(context).fetchBlogs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Blogs",
            style: getBoldStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: BlocBuilder<FetchBlogsCubit, FetchBlogsState>(
          builder: (context, state) {
            final cubit = BlocProvider.of<FetchBlogsCubit>(context);
            final blog = cubit.blogsData;
            if (state is FetchBlogsLoading) {
              return CustomLoadingSpinner();
            }
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BlogsDetailsScreeen(
                                name: cubit.blogsData.plants![i].name!,
                                imageUrl: cubit.blogsData.plants![i].imageUrl!,
                                description: cubit.blogsData.plants![i].description!,
                                sunLight: cubit.blogsData.plants![i].sunLight.toString(),
                                waterCapacity: cubit.blogsData.plants![i].waterCapacity.toString(),
                                temprature: cubit.blogsData.plants![i].temperature.toString(),
                              ),
                            ),
                          );
                        },
                        child: SearchedCardItem(
                          imageUrl: blog.plants![i].imageUrl,
                          name: blog.plants![i].name!,
                          description: blog.plants![i].description!,
                        ),
                      );
                    },
                    itemCount: blog.plants?.length,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ProductDetailsScreen(
                                name: cubit.blogsData.plants![i].name!,
                                imageUrl: cubit.blogsData.plants![i].imageUrl!,
                                description: cubit.blogsData.plants![i].description!,
                              ),
                            ),
                          );
                        },
                        child: SearchedCardItem(
                          imageUrl: blog.seeds![i].imageUrl,
                          name: blog.seeds![i].name!,
                          description: blog.seeds![i].description!,
                        ),
                      );
                    },
                    itemCount: blog.seeds?.length,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ProductDetailsScreen(
                                name: cubit.blogsData.plants![i].name!,
                                imageUrl: cubit.blogsData.plants![i].imageUrl!,
                                description: cubit.blogsData.plants![i].description!,
                              ),
                            ),
                          );
                        },
                        child: SearchedCardItem(
                          imageUrl: blog.tools![i].imageUrl,
                          name: blog.tools![i].name!,
                          description: blog.tools![i].description!,
                        ),
                      );
                    },
                    itemCount: blog.tools?.length,
                  ),
                ],
              ),
            );
          },
        ));
  }
}
