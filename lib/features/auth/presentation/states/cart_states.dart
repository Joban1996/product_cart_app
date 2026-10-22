import '../../data/models/product_model.dart';

abstract class CartStates {}

class CartLoaded extends CartStates {
  final List<ProductModel> data;

  CartLoaded(this.data);
}