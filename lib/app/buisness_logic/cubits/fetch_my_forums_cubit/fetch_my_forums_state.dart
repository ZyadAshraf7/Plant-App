part of 'fetch_my_forums_cubit.dart';

@immutable
abstract class FetchMyForumsState {}

class FetchMyForumsInitial extends FetchMyForumsState {}
class FetchMyForumsLoading extends FetchMyForumsState {}
class FetchMyForumsLoaded extends FetchMyForumsState {}
class FetchMyForumsError extends FetchMyForumsState {}
