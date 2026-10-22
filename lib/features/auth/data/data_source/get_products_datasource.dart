import 'package:dio/dio.dart';
import 'package:product_cart_app/core/network/dio_client.dart';
import 'package:product_cart_app/core/network/handle_dio_error.dart';
import '../models/product_model.dart';

class GetProductsDatasource {
  final DioClient dioClient;
  GetProductsDatasource(this.dioClient);


  Future<List<ProductModel>> getProducts()async{
    try {
      var response = await dioClient.dio.get('products');
      var parsedRes = response.data.map<ProductModel>((val)=> ProductModel.fromJson(val)).toList();

      return parsedRes;
    }on DioException catch(e){
       throw handleDioError(e);
    }
  }

}