import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/cart.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  List<Cart> cartItems = [];
  int totalPrice = 0;

  Cart findProductbyId(String id) {
    return cartItems.firstWhere((e) => e.id == id);
  }

  void addProductToCart(Cart cartItem){
    bool exist = checkIfProductExist(cartItem);
    if(!exist){
      cartItems.add(cartItem);
    }
  }
  bool checkIfProductExist(Cart cartItem){
    if(cartItems.any((element) => element.id==cartItem.id)){
      return true;
    }else{
      return false;
    }
  }

  incrementQuantity(String id) {
    final cartItem = findProductbyId(id);
    cartItem.quantity = (cartItem.quantity! + 1);
    emit(CartItemQuantityChange());
  }

  void decrementQuantity(String id) {
    final cartItem = findProductbyId(id);
    if (cartItem.quantity! > 1) {
      cartItem.quantity = (cartItem.quantity! - 1);
      emit(CartItemQuantityChange());
    }
  }
  removeProductFromCart(Cart cartItem) {
    cartItems.removeWhere((element) => element.id == cartItem.id);
    emit(CartItemDeleted());
  }
  int calculateTotalPrice(){
    totalPrice=0;
    for(var item in cartItems){
      if(item.price==null||item.price==0) {
        continue;
      }
      totalPrice+=item.price!*item.quantity! ;
    }
    return totalPrice;
  }
}
