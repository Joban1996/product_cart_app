import 'package:product_cart_app/features/auth/data/models/product_model.dart';

abstract class WishlistEvents {}

class AddToWishlist extends WishlistEvents{
  ProductModel item;
  AddToWishlist(this.item);
}