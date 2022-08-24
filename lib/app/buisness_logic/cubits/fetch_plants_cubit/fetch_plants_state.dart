part of 'fetch_plants_cubit.dart';

@immutable
abstract class FetchPlantsState {}

class FetchPlantsInitial extends FetchPlantsState {}
class FetchPlantsLoading extends FetchPlantsState {}
class FetchPlantsSuccess extends FetchPlantsState {}
class FetchPlantsError extends FetchPlantsState {}
class FetchPlantsQuantityChange extends FetchPlantsState {}
