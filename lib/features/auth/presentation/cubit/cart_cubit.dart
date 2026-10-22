import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_cart_app/features/auth/data/models/product_model.dart';

import '../states/cart_states.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartLoaded([]));

  List<ProductModel> cartItems = [];

  void toggleCart(ProductModel product) {
    if (cartItems.any((item) => item.id == product.id)) {
      cartItems.removeWhere((item) => item.id == product.id);
    } else {
      cartItems.add(product);
    }

    emit(CartLoaded(cartItems));
  }

}