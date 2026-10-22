import 'package:flutter/material.dart';
import 'package:product_cart_app/core/di/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_cart_app/features/auth/presentation/cubit/cart_cubit.dart';
import 'package:product_cart_app/features/auth/presentation/cubit/product_cubit.dart';
import 'package:product_cart_app/features/auth/presentation/screens/product_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpLocator();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_)=>
    getIt<ProductCubit>()..hitApi()),
    BlocProvider(create: (_)=> getIt<CartCubit>())
    ], child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductListScreen())));
}
