import 'package:flutter/material.dart';
import 'package:product_cart_app/core/di/injection.dart';
import 'package:product_cart_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/auth/presentation/screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpLocator();
  runApp(MaterialApp(
      home: BlocProvider(create: (_)=> getIt<AuthCubit>(),child: Splash(),)));
}
