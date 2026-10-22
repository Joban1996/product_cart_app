import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_cart_app/features/auth/presentation/bloc/wishlist_bloc.dart';
import 'package:product_cart_app/features/auth/presentation/events/wishlist_events.dart';
import 'package:product_cart_app/features/auth/presentation/screens/widgets/product_list_tile.dart';
import 'package:product_cart_app/features/auth/presentation/screens/widgets/products_app_bar.dart';
import 'package:product_cart_app/features/auth/presentation/states/wishlist_states.dart';


class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(kToolbarHeight),
          child: ProductsAppBar(title: 'WishList', isActions: false,)),
      body: BlocBuilder<WishlistBloc,WishlistStates>(builder: (context,state){
        if(state is WishlistLoaded){
          if(state.data.isEmpty){
            return Center(child: Text('No Data Found..'));
          }
          return GridView.builder(
              itemCount: state.data.length,
              gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.65),
            itemBuilder: (BuildContext context, int index) {
                return ProductListTile(product: state.data[index],
                  onHeartTap: (){
                   context.read<WishlistBloc>().add(AddToWishlist(state.data[index]));
                  },
                  isInCart: false,
                  onCartTap: (){}, isInWishlist: true,);
            },

          );
        }
        return Container();
      }),
    );
  }
}
