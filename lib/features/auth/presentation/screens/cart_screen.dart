import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_cart_app/core/utils/size_utils.dart';
import 'package:product_cart_app/features/auth/presentation/states/cart_states.dart';
import 'package:product_cart_app/features/auth/presentation/screens/widgets/product_list_tile.dart';
import '../cubit/cart_cubit.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var itemHeight = (context.screenHeight)/3;
    var itemWidth = (context.screenWidth)/2;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: BlocBuilder<CartCubit,CartStates>(builder: (context,state){
        if(state is CartLoaded){
          final cartItems = state.data;
          if(cartItems.isEmpty){
            return Center(child: Text("Cart is empty"));
          }
          return GridView.builder(
            itemCount: cartItems.length,
              shrinkWrap: true,
              gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
              childAspectRatio: itemWidth/itemHeight),
              itemBuilder: (context,index){
            return ProductListTile(
              product: cartItems[index],
              isInCart: true, onCartTap: () {
                context.read<CartCubit>().toggleCart(cartItems[index]);
            }, isInWishlist: false,);
          });
        }
        return Container();
      }),
    );
  }
}
