import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:konaf_skora/src/features/auth/presentation/logic/login/login_cubit.dart';

import '../../src/features/auth/data/remote/auth_api_services.dart';
import '../../src/features/auth/data/remote/auth_remote_ds.dart';
import '../../src/features/auth/domain/repository/auth_repo.dart';
import '../../src/features/auth/domain/usecase/login_use_case.dart';
import '../../src/features/auth/domain/usecase/register_use_case.dart';
import '../../src/features/auth/presentation/logic/register/register_cubit.dart';
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

  getIt.registerLazySingleton<AuthApiServices>(() => AuthApiServicesImpl(getIt()));

  ///! --DataSources-- ///
  getIt.registerLazySingleton<AuthRemoteDs>(() => AuthRemoteDsImpl(getIt()));

  /// !-- Repositories -- ///
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(getIt()));

  /// !-- UseCases -- ///
  getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(getIt()));
  getIt.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(getIt()));

  // !Cubits //
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerLazySingleton<RegisterCubit>(() => RegisterCubit(getIt()));

}
