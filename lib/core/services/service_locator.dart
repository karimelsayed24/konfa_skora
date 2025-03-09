import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:konaf_skora/src/features/auth/presentation/logic/login/login_cubit.dart';
import 'package:konaf_skora/src/features/my_orders/data/remote/my_order_remote_ds.dart';
import 'package:konaf_skora/src/features/profile/data/remote/profile_remote_ds.dart';

import '../../src/features/auth/data/remote/auth_api_services.dart';
import '../../src/features/auth/data/remote/auth_remote_ds.dart';
import '../../src/features/auth/domain/repository/auth_repo.dart';
import '../../src/features/auth/domain/usecase/login_use_case.dart';
import '../../src/features/auth/domain/usecase/register_use_case.dart';
import '../../src/features/auth/presentation/logic/register/register_cubit.dart';
import '../../src/features/home/data/remote/home_api_services.dart';
import '../../src/features/home/data/remote/home_remote_ds.dart';
import '../../src/features/home/domain/repo/home_repo.dart';
import '../../src/features/home/domain/usecase/get_banner_uc.dart';
import '../../src/features/home/domain/usecase/get_best_seller_uc.dart';
import '../../src/features/home/domain/usecase/get_daily_order_uc.dart';
import '../../src/features/home/presentation/logic/home_cubit.dart';
import '../../src/features/my_orders/data/remote/my_order_api_services.dart';
import '../../src/features/my_orders/domain/repo/my_order_repository.dart';
import '../../src/features/my_orders/domain/usecase/get_my_orders_usecase.dart';
import '../../src/features/my_orders/domain/usecase/get_order_details_use_case.dart';
import '../../src/features/my_orders/presentation/logic/order_details_cubit.dart';
import '../../src/features/my_orders/presentation/logic/orders_cubit.dart';
import '../../src/features/profile/data/remote/profile_api_services.dart';
import '../../src/features/profile/domain/repo/profile_repository.dart';
import '../../src/features/profile/domain/usecase/get_profile_usecase.dart';
import '../../src/features/profile/domain/usecase/update_profile_usecase.dart';
import '../../src/features/profile/presentation/logic/profile_cubit.dart';
import '../app_cubit/app_cubit.dart';
import '../data/api/api_consumer.dart';
import '../data/api/dio_consumer.dart';
import '../data/cached/cache_helper.dart';

final GetIt getIt = GetIt.instance;
void setupLocator() {
  ///! FOR APP CUBIT ///
  getIt.registerFactory<AppCubit>(() => AppCubit());

  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt
      .registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: getIt<Dio>()));
  getIt.registerLazySingleton<ImagePicker>(() => ImagePicker());

//!Api Services //

  getIt.registerLazySingleton<AuthApiServices>(
      () => AuthApiServicesImpl(getIt()));
  getIt.registerLazySingleton<HomeApiServices>(
      () => HomeApiServicesImpl(getIt()));
  getIt.registerLazySingleton<ProfileApiServices>(
    () => ProfileApiServicesImpl(getIt()),
  );
  getIt.registerLazySingleton<OrdersApiServices>(
      () => OrdersApiServicesImpl(getIt()));

  ///! --DataSources-- ///
  getIt.registerLazySingleton<AuthRemoteDs>(() => AuthRemoteDsImpl(getIt()));
  getIt.registerLazySingleton<HomeRemoteDs>(() => HomeRemoteDsImpl(getIt()));
  getIt.registerLazySingleton<ProfileRemoteDs>(
      () => ProfileRemoteDsImpl(getIt()));
  getIt.registerLazySingleton<MyOrderRemoteDs>(
      () => MyOrderRemoteDsImpl(getIt()));

  /// !-- Repositories -- ///
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(getIt()));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(getIt()));
  getIt.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<OrdersRepository>(
      () => OrdersRepositoryImpl(getIt()));

  /// !-- UseCases -- ///
  getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(getIt()));
  getIt.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(getIt()));
  getIt.registerLazySingleton<GetBannerUc>(() => GetBannerUc(getIt()));
  getIt.registerLazySingleton<GetBestSellerUC>(() => GetBestSellerUC(getIt()));
  getIt.registerLazySingleton<GetDailyOrderUC>(() => GetDailyOrderUC(getIt()));
  getIt.registerLazySingleton(() => GetProfileUseCase(getIt()));
  getIt.registerLazySingleton(() => UpdateProfileUseCase(getIt()));
  getIt.registerLazySingleton(() => GetMyOrdersUseCase(getIt()));
  getIt.registerLazySingleton(() => GetOrderDetailsUseCase(getIt()));

  // !Cubits //
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerLazySingleton<RegisterCubit>(() => RegisterCubit(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt(), getIt(), getIt()));
  getIt.registerFactory(() => ProfileCubit(getIt(), getIt()));
  getIt.registerFactory(() => OrdersCubit(getIt()));
  getIt.registerFactory(() => OrderDetailsCubit(getIt()));
}
