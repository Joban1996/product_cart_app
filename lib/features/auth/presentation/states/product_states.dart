import 'package:product_cart_app/features/auth/data/models/product_model.dart';

abstract class ProductStates {}

class ProductsLoading extends ProductStates{}

class ProductsLoaded extends ProductStates{
  List<ProductModel> data;
  ProductsLoaded(this.data);
}

class ProductsError extends ProductStates{
  String error;
  ProductsError(this.error);
}