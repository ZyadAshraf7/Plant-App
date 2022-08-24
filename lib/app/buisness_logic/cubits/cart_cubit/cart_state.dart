part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}
class CartItemQuantityChange extends CartState {}
class CartItemDeleted extends CartState {}
