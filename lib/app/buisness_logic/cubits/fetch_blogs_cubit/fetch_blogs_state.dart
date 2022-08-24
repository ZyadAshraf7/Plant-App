part of 'fetch_blogs_cubit.dart';

@immutable
abstract class FetchBlogsState {}

class FetchBlogsInitial extends FetchBlogsState {}
class FetchBlogsLoading extends FetchBlogsState {}
class FetchBlogsLoaded extends FetchBlogsState {}
class FetchBlogsError extends FetchBlogsState {}
