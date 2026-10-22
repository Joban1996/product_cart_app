import 'package:product_cart_app/core/network/dio_client.dart';
import 'package:product_cart_app/core/storage/secure_storage_utils.dart';
import 'package:product_cart_app/features/auth/data/data_source/get_products_datasource.dart';
import 'package:product_cart_app/features/auth/data/repositories/product_repositories.dart';
import 'package:product_cart_app/features/auth/data/repositories/product_repository_implementation.dart';
import 'package:get_it/get_it.dart';
import 'package:product_cart_app/features/auth/presentation/cubit/cart_cubit.dart';
import 'package:product_cart_app/features/auth/presentation/cubit/product_cubit.dart';

import '../../features/auth/presentation/cubit/auth_cubit.dart';


final GetIt getIt = GetIt.instance;
Future<void> setUpLocator()async {
  getIt.registerLazySingleton<SecureStorageUtils>(()=>SecureStorageUtils());
  getIt.registerLazySingleton<DioClient>(()=>DioClient());
  getIt.registerLazySingleton<GetProductsDatasource>(()=>GetProductsDatasource(getIt<DioClient>()));
  getIt.registerLazySingleton<ProductsRepositories>(()=>
      ProductRepoImplementation(getIt<GetProductsDatasource>(), getIt<SecureStorageUtils>()));
  getIt.registerLazySingleton<AuthCubit>(
        () => AuthCubit(getIt<ProductsRepositories>())
  );
  getIt.registerLazySingleton<ProductCubit>(()=> ProductCubit(getIt<ProductsRepositories>()));
  getIt.registerLazySingleton<CartCubit>(()=> CartCubit());

}