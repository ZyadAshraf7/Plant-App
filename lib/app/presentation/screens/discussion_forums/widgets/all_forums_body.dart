import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/app/buisness_logic/cubits/fetch_all_forms_cubit/fetch_all_forms_cubit.dart';
import 'package:plant_app/app/presentation/screens/discussion_forums/widgets/forum_post.dart';

class AllForumsBody extends StatelessWidget {
  const AllForumsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FetchAllFormsCubit>(context);
    return ListView.separated(
      separatorBuilder: (context,_){
        return SizedBox(height: 20);
      },
      padding: EdgeInsets.all(24),
      itemBuilder: (context,i){
        return ForumPost(forum: cubit.allForums[i],);
      },
      itemCount: cubit.allForums.length,
    );
  }
}
