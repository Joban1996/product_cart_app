import 'package:product_cart_app/features/auth/data/repositories/product_repositories.dart';
import 'package:product_cart_app/features/auth/presentation/states/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<LoginState>{

  final ProductsRepositories authRepositories;
  AuthCubit(this.authRepositories): super(LoginLoading());

  void hitLogin(String email,String password){

  }

}