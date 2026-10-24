import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_cart_app/features/auth/data/models/product_model.dart';
import 'package:product_cart_app/features/auth/data/repositories/product_repositories.dart';
import 'package:product_cart_app/features/auth/presentation/states/product_states.dart';
import 'dart:async';

class ProductCubit extends Cubit<ProductStates>{
  final ProductsRepositories productsRepositories;
  ProductCubit(this.productsRepositories) : super(ProductsLoading());
  Timer? debaunce;

  List<ProductModel> apiResponse = [];

  List<ProductModel> filteredProducts = [];

  void hitApi()async{
    emit(ProductsLoading());
    try{
      apiResponse = await productsRepositories.getProductsFromAPI();
      filteredProducts.addAll(apiResponse);
      emit(ProductsLoaded(filteredProducts));
    }catch(e){
      emit(ProductsError(e.toString()));
    }
  }

  void searchProducts(String search){
    debaunce?.cancel();
    debaunce = Timer(const Duration(seconds: 1), (){
      filteredProducts.clear();
      var value =  apiResponse.where((element)=>element.title.toLowerCase().contains(search.toLowerCase()));
      filteredProducts.addAll(value);
      emit(ProductsLoaded(filteredProducts));
    });
  }

  @override
  Future<void> close() {
    // TODO: implement close
    debaunce?.cancel();
    return super.close();
  }

}