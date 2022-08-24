import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:plant_app/app/presentation/screens/discussion_forums/widgets/all_forums_body.dart';
import 'package:plant_app/app/presentation/screens/discussion_forums/widgets/my_forums_body.dart';

part 'discussion_forums_state.dart';

class DiscussionForumsCubit extends Cubit<DiscussionForumsState> {
  DiscussionForumsCubit() : super(DiscussionForumsInitial());

}
