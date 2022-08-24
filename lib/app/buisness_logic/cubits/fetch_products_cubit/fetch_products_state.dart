part of 'fetch_products_cubit.dart';

@immutable
abstract class FetchProductsState {}

class FetchProductsInitial extends FetchProductsState {}
class FetchProductsLoading extends FetchProductsState {}
class FetchProductsLoaded extends FetchProductsState {}
class FetchProductsError extends FetchProductsState {}
class FetchProductsQuantityChange extends FetchProductsState {}
