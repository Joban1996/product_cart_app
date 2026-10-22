import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_cart_app/features/auth/data/models/product_model.dart';
import 'package:product_cart_app/features/auth/presentation/events/wishlist_events.dart';
import 'package:product_cart_app/features/auth/presentation/states/wishlist_states.dart';

class WishlistBloc extends Bloc<WishlistEvents,WishlistStates>{
  WishlistBloc():super(WishlistInitial()){
    on<AddToWishlist>(toggleWishlist);
  }

  List<ProductModel> wishlistItems = [];


  void toggleWishlist(AddToWishlist event,Emitter<WishlistStates> emit){
     if(wishlistItems.any((val)=> val.id == event.item.id)){
       wishlistItems.removeWhere((val)=> val.id == event.item.id);
     }else {
       wishlistItems.add(event.item);
     }
     emit(WishlistLoaded(wishlistItems));
  }


}