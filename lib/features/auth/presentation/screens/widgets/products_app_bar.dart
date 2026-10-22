import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_cart_app/core/theme/app_colors.dart';
import 'package:product_cart_app/core/theme/app_theme.dart';
import 'package:product_cart_app/features/auth/presentation/bloc/wishlist_bloc.dart';
import 'package:product_cart_app/features/auth/presentation/cubit/cart_cubit.dart';
import 'package:product_cart_app/features/auth/presentation/screens/cart_screen.dart';
import 'package:product_cart_app/features/auth/presentation/screens/wishlist_screen.dart';


class ProductsAppBar extends StatelessWidget {
  const ProductsAppBar({super.key, required this.title, required this.isActions});
  final String title;
  final bool isActions;

  @override
  Widget build(BuildContext context) {
   final cartItems = context.watch<CartCubit>().cartItems;
   final wishlist = context.watch<WishlistBloc>().wishlistItems;
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: TextStyle(fontSize: AppFontSizes.xl,color: AppColors.textPrimary,fontWeight: FontWeight.w600),),
          Text('Discover amazing products',style: TextStyle(fontSize: AppFontSizes.base,color: AppColors.textSecondary,fontWeight: FontWeight.w400))
        ],
      ),
      actions: isActions ? [
        Stack(
          alignment: Alignment.topRight,
          children: [
            IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> WishlistScreen()));
                },
                icon: Icon(Icons.favorite_outline,color: AppColors.textPrimary,size: 28,)),
            wishlist.isNotEmpty ? Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(shape: BoxShape.circle,color: AppColors.bgRed),
              child: Text(wishlist.length.toString(),
                style: TextStyle(color: AppColors.textWhite,fontSize: AppFontSizes.xs),),
            ):Container()
          ],
        ),

        Stack(
          alignment: Alignment.topRight,
          children: [
            IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> CartScreen()));
                },
                icon: Icon(Icons.shopping_cart_outlined,color: AppColors.textPrimary,size: 28,)),
           cartItems.isNotEmpty ? Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(shape: BoxShape.circle,color: AppColors.bgRed),
              child: Text(cartItems.length.toString(),
                style: TextStyle(color: AppColors.textWhite,fontSize: AppFontSizes.xs),),
    ):Container()
          ],
        ),
        Padding(padding: EdgeInsetsGeometry.only(right: 12))
      ]: null,
    );
  }
}
