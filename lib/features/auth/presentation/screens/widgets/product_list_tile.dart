import 'package:flutter/material.dart';
import 'package:product_cart_app/core/theme/app_colors.dart';
import 'package:product_cart_app/core/theme/app_theme.dart';
import 'package:product_cart_app/features/auth/data/models/product_model.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({super.key,
    required this.product, required this.isInCart,required this.onCartTap});
  final ProductModel product;
  final bool isInCart;
  final VoidCallback onCartTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(color: AppColors.textWhite,borderRadius: BorderRadius.circular(8)),
      child: Column(
        spacing: 4.0,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Container(
           decoration: BoxDecoration(color: AppColors.textSecondary,borderRadius: BorderRadius.circular(8)),
             padding: EdgeInsets.all(4),
             child: Image.network(product.image,
               fit: BoxFit.contain,height: 110,width: double.infinity,)),
          Text(product.title,style: TextStyle(color: AppColors.textPrimary),
            maxLines: 2,overflow: TextOverflow.ellipsis,),
          Text(product.category.name,style: TextStyle(fontSize: AppFontSizes.xs),),
          Row(
            children: [
              Icon(Icons.star,size: 19,color: AppColors.gold,),
              SizedBox(width: 4,),
              Text(product.rating.rate.toString(),style: TextStyle(fontSize: AppFontSizes.xs),),
            ],
          ),
          Expanded(child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$${product.price.toString()}",style:
              TextStyle(fontSize: AppFontSizes.sm,fontWeight: FontWeight.w600),),
              Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(shape: BoxShape.circle,
                      color: isInCart ? AppColors.primary : AppColors.textGrey),
                  child: InkWell(
                    onTap: onCartTap,
                    child: Icon(Icons.shopping_cart_outlined,
                      size: 22,color: AppColors.textWhite,),
                  ))
            ],
          )

        ],
      ),
    );
  }
}
