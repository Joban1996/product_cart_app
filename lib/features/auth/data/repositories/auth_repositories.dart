import 'package:product_cart_app/features/auth/data/models/login_model.dart';

abstract class AuthRepositories {

  Future<LoginResponseModel> login(String email,String password);
}