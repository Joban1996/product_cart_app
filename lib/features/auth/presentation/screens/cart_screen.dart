import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_cart_app/core/utils/size_utils.dart';
import 'package:product_cart_app/features/auth/presentation/bloc/coupon_bloc.dart';
import 'package:product_cart_app/features/auth/presentation/events/coupon_events.dart';
import 'package:product_cart_app/features/auth/presentation/states/cart_states.dart';
import 'package:product_cart_app/features/auth/presentation/screens/widgets/product_list_tile.dart';
import 'package:product_cart_app/features/auth/presentation/states/coupon_states.dart';
import '../../../../core/utils/extensions.dart';
import '../cubit/cart_cubit.dart';


class CartScreen extends StatelessWidget {
   CartScreen({super.key});

  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var itemHeight = (context.screenHeight)/3;
    var itemWidth = (context.screenWidth)/2;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        leading: InkWell(
            onTap: (){
              context.read<CouponBloc>().add(RemoveCoupon());
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<CartCubit,CartStates>(builder: (context,state){
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
                    crossAxisSpacing: 4,mainAxisSpacing: 4,
                    childAspectRatio: itemWidth/itemHeight),
                    itemBuilder: (context,index){
                  return ProductListTile(
                    product: cartItems[index],
                    isInCart: true, onCartTap: () {
                      context.read<CartCubit>().toggleCart(cartItems[index]);
                        context.read<CouponBloc>().add(RemoveCoupon());
                  }, isInWishlist: false,);
                }).paddingSymmetric(horizontal: 8.0);
              }
              return Container();
            }),
          ),
          BlocBuilder<CouponBloc,CouponStates>(builder: (context,state){
            double total  = context.watch<CartCubit>().cartItems.fold(0, (sum, ele)=> sum+ele.price);
            return Column(
              spacing: 8.0,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  controller: controller,
                  decoration: InputDecoration(hint: Text('Enter coupon'),border: OutlineInputBorder()),
                ),
                ElevatedButton(onPressed: (){
                  context.read<CouponBloc>().add(ApplyCoupon(controller.text, total));
                }, child: Text("Apply")),

                Text('Total: \$$total'),

                if(state is CouponApplied)
                  Text('Total After Discount \$${(total-state.discount).toStringAsFixed(2)}')
              ],
            ).paddingAll(8);
          })
        ],
      ),
    );
  }
}
