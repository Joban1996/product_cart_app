import 'package:product_cart_app/features/auth/data/models/login_model.dart';
import 'package:product_cart_app/features/auth/data/models/product_model.dart';

abstract class ProductsRepositories {

  Future<List<ProductModel>> getProductsFromAPI();
}