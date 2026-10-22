import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_cart_app/core/utils/size_utils.dart';
import 'package:product_cart_app/features/auth/presentation/bloc/wishlist_bloc.dart';
import 'package:product_cart_app/features/auth/presentation/cubit/cart_cubit.dart';
import 'package:product_cart_app/features/auth/presentation/cubit/product_cubit.dart';
import 'package:product_cart_app/features/auth/presentation/events/wishlist_events.dart';
import 'package:product_cart_app/features/auth/presentation/states/product_states.dart';
import 'package:product_cart_app/features/auth/presentation/screens/widgets/product_list_tile.dart';
import 'package:product_cart_app/features/auth/presentation/screens/widgets/products_app_bar.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double itemHeight = (context.screenHeight - kToolbarHeight - 24) / 2.8;
    final double itemWidth = context.screenWidth / 2;
    final cartItems = context.watch<CartCubit>().cartItems;
    final wishlistItems = context.watch<WishlistBloc>().wishlistItems;
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(kToolbarHeight),
          child: ProductsAppBar(title: 'Products', isActions: true,)),
      body: Column(
        children: [
          SizedBox(height: 16,),
          SizedBox(
            height: 40,
            child: Container(
              margin: EdgeInsets.only(right: 8,left: 8),
              child: TextField(
                cursorHeight: 16,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8),

                    prefixIcon: Icon(Icons.search),
                    hint: Text('Search Products..'),border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32))),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<ProductCubit,ProductStates>(
                builder: (context,state){
              if(state is ProductsLoaded){
                return SingleChildScrollView(
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                        childAspectRatio: (itemWidth / itemHeight),crossAxisSpacing: 8,mainAxisSpacing: 8),
                      padding: EdgeInsets.all(8),
                      itemCount: state.data.length,
                      itemBuilder: (context,index){
                        return ProductListTile(
                          product: state.data[index],
                          isInCart: cartItems.any((item)=> item.id == state.data[index].id),
                          onCartTap: () {
                            context.read<CartCubit>().toggleCart(state.data[index]);
                          },
                          isInWishlist: wishlistItems.any((item)=> item.id == state.data[index].id),
                          onHeartTap: (){
                            context.read<WishlistBloc>().add(AddToWishlist(state.data[index]));
                          },
                        );
                      }),
                );
              }
              if(state is ProductsLoading){
                return Center(child: CircularProgressIndicator());
              }
              if(state is ProductsError){
                return Center(child: Text(state.error.toString()));
              }
              return Container();
            })
          ),
        ],
      ),
    );
  }
}
