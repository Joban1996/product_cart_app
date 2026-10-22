import 'package:product_cart_app/features/auth/data/models/product_model.dart';

abstract class WishlistStates {}

class WishlistInitial extends WishlistStates{}

class WishlistLoaded extends WishlistStates{
  List<ProductModel> data;
  WishlistLoaded(this.data);
}