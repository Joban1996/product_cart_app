import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_cart_app/features/auth/data/repositories/product_repositories.dart';
import 'package:product_cart_app/features/auth/presentation/states/product_states.dart';

class ProductCubit extends Cubit<ProductStates>{
  final ProductsRepositories productsRepositories;
  ProductCubit(this.productsRepositories) : super(ProductsLoading());


  void hitApi()async{
    emit(ProductsLoading());
    try{
      final response = await productsRepositories.getProductsFromAPI();
      emit(ProductsLoaded(response));
    }catch(e){
      emit(ProductsError(e.toString()));
    }
  }


}