import 'package:product_cart_app/core/storage/secure_storage_utils.dart';
import 'package:product_cart_app/features/auth/data/data_source/get_products_datasource.dart';
import 'package:product_cart_app/features/auth/data/models/product_model.dart';
import 'package:product_cart_app/features/auth/data/repositories/product_repositories.dart';

class ProductRepoImplementation implements ProductsRepositories {
  final GetProductsDatasource authRemoteDatasource;
  final SecureStorageUtils secureStorageUtils;

  ProductRepoImplementation(this.authRemoteDatasource,this.secureStorageUtils);

  @override
  Future<List<ProductModel>> getProductsFromAPI() async{
    // TODO: implement getProductsFromAPI
    final response = await authRemoteDatasource.getProducts();

    return response;
  }



}