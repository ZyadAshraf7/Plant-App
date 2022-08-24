import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/app/buisness_logic/cubits/fetch_my_forums_cubit/fetch_my_forums_cubit.dart';

import 'forum_post.dart';

class MyForumsBody extends StatelessWidget {
  const MyForumsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FetchMyForumsCubit>(context);
    return ListView.separated(
      separatorBuilder: (context,_){
        return SizedBox(height: 20);
      },
      padding: EdgeInsets.all(24),
      itemBuilder: (context,i){
        return ForumPost(forum: cubit.myForums[i],);
      },
      itemCount: cubit.myForums.length,
    );
  }
}
