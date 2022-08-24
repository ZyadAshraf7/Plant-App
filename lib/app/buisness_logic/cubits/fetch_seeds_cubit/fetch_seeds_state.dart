part of 'fetch_seeds_cubit.dart';

@immutable
abstract class FetchSeedsState {}

class FetchSeedsInitial extends FetchSeedsState {}
class FetchSeedsLoading extends FetchSeedsState {}
class FetchSeedsSuccess extends FetchSeedsState {}
class FetchSeedsError extends FetchSeedsState {}
class FetchSeedsQuantityChange extends FetchSeedsState {}
