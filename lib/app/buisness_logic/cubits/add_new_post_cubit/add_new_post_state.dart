part of 'add_new_post_cubit.dart';

@immutable
abstract class AddNewPostState {}

class AddNewPostInitial extends AddNewPostState {}
class AddNewPostLoading extends AddNewPostState {}
class AddNewPostSuccess extends AddNewPostState {}
class AddNewPostError extends AddNewPostState {}
class ImagePickedSuccess extends AddNewPostState {}
