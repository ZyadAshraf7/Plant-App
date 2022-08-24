import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:plant_app/app/data/repositories/fetch_products_repository.dart';

import '../../../data/models/product.dart';

part 'fetch_products_state.dart';

class FetchProductsCubit extends Cubit<FetchProductsState> {
  FetchProductsCubit({required this.productsRepository}) : super(FetchProductsInitial());
  ProductsRepository productsRepository;
  List<Product> productsList = [];

  void fetchProduct()async{
    try {
      emit(FetchProductsLoading());
      final data = await productsRepository.fetchProducts();
      final products = data['data'] as List<dynamic>;
      productsList = products.map((e) => Product.fromJson(e)).toList();
      if(productsList.isNotEmpty){
        emit(FetchProductsLoaded());
      }else{
        emit(FetchProductsError());
      }
    }catch(e){
      print(e.toString());
      emit(FetchProductsError());
    }
  }
  Product findProductbyId(String id){
    return productsList.firstWhere((e) => e.productId==id);
  }
  incrementQuantity(String id){
    final product = findProductbyId(id);
    product.quantity=(product.quantity!+1);
    emit(FetchProductsQuantityChange());
  }
  void decrementQuantity(String id){
    final product = findProductbyId(id);
    if(product.quantity!>1){
      product.quantity=(product.quantity!-1);
      emit(FetchProductsQuantityChange());
    }
  }
}
