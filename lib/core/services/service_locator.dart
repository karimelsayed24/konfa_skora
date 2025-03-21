import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:konaf_skora/src/features/auth/presentation/logic/login/login_cubit.dart';
import 'package:konaf_skora/src/features/cart/presentation/logic/cart_cubit.dart';
import 'package:konaf_skora/src/features/my_orders/data/remote/my_order_remote_ds.dart';
import 'package:konaf_skora/src/features/profile/data/remote/profile_remote_ds.dart';

import '../../src/features/auth/data/remote/auth_api_services.dart';
import '../../src/features/auth/data/remote/auth_remote_ds.dart';
import '../../src/features/auth/domain/repository/auth_repo.dart';
import '../../src/features/auth/domain/usecase/forget_password_use_case.dart';
import '../../src/features/auth/domain/usecase/login_use_case.dart';
import '../../src/features/auth/domain/usecase/register_use_case.dart';
import '../../src/features/auth/domain/usecase/resend_code_use_case.dart';
import '../../src/features/auth/domain/usecase/set_location_use_case.dart';
import '../../src/features/auth/domain/usecase/verify_email_use_case.dart';
import '../../src/features/auth/presentation/logic/password_reset_cubit.dart';
import '../../src/features/auth/presentation/logic/register/register_cubit.dart';
import '../../src/features/auth/presentation/logic/set_location/set_location_cubit.dart';
import '../../src/features/auth/presentation/logic/verification/verification_cubit.dart';
import '../../src/features/cart/data/remote/cart_api_services.dart';
import '../../src/features/cart/data/remote/cart_remote_ds.dart';
import '../../src/features/cart/domain/repo/cart_repository.dart';
import '../../src/features/cart/domain/usecase/cart_use_case.dart';
import '../../src/features/cart/domain/usecase/check_out_use_case.dart';
import '../../src/features/cart/presentation/logic/checkout_cubit.dart';
import '../../src/features/home/data/remote/home_api_services.dart';
import '../../src/features/home/data/remote/home_remote_ds.dart';
import '../../src/features/home/domain/repo/home_repo.dart';
import '../../src/features/home/domain/usecase/get_banner_uc.dart';
import '../../src/features/home/domain/usecase/get_best_seller_uc.dart';
import '../../src/features/home/domain/usecase/get_daily_order_uc.dart';
import '../../src/features/home/presentation/logic/home_cubit.dart';
import '../../src/features/location/data/remote/address_api_services.dart';
import '../../src/features/location/data/remote/address_remote_ds.dart';
import '../../src/features/location/domain/repo/address_repo.dart';
import '../../src/features/location/domain/usecase/address_use_case.dart';
import '../../src/features/location/presentation/logic/address_cubit.dart';
import '../../src/features/my_orders/data/remote/my_order_api_services.dart';
import '../../src/features/my_orders/domain/repo/my_order_repository.dart';
import '../../src/features/my_orders/domain/usecase/get_my_orders_usecase.dart';
import '../../src/features/my_orders/domain/usecase/get_order_details_use_case.dart';
import '../../src/features/my_orders/presentation/logic/order_details_cubit.dart';
import '../../src/features/my_orders/presentation/logic/orders_cubit.dart';
import '../../src/features/points/data/remote/prize_products_api_services.dart';
import '../../src/features/points/data/remote/prize_products_remote_ds.dart';
import '../../src/features/points/domain/repo/prize_products_repository.dart';
import '../../src/features/points/domain/usecase/point_usecase.dart';
import '../../src/features/points/domain/usecase/rate_app_usecase.dart';
import '../../src/features/points/presentation/logic/prize_product_cubit.dart';
import '../../src/features/points/presentation/logic/rate/rate_app_cubit.dart';
import '../../src/features/profile/data/remote/profile_api_services.dart';
import '../../src/features/profile/domain/repo/profile_repository.dart';
import '../../src/features/profile/domain/usecase/change_password_usecase.dart';
import '../../src/features/profile/domain/usecase/delete_account_usecase.dart';
import '../../src/features/profile/domain/usecase/get_profile_usecase.dart';
import '../../src/features/profile/domain/usecase/logout_usecsae.dart';
import '../../src/features/profile/domain/usecase/update_profile_usecase.dart';
import '../../src/features/profile/presentation/logic/change_password_cubit.dart';
import '../../src/features/profile/presentation/logic/profile_cubit.dart';
import '../../src/features/support_policy/data/remote/questions_api_services.dart';
import '../../src/features/support_policy/data/remote/questions_remote_ds.dart';
import '../../src/features/support_policy/domain/repo/questions_repository.dart';
import '../../src/features/support_policy/domain/usecase/get_questions_usecase.dart';
import '../../src/features/support_policy/presentation/logic/questions_cubit.dart';
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
  getIt.registerLazySingleton<CartApiServices>(
      () => CartApiServicesImpl(getIt()));

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
  getIt.registerLazySingleton<QuestionsApiServices>(
      () => QuestionsApiServicesImpl(getIt()));

  getIt.registerLazySingleton<PrizeProductsApiServices>(
      () => PrizeProductsApiServicesImpl(getIt()));

  getIt.registerLazySingleton<AddressApiServices>(
      () => AddressApiServicesImpl(getIt()));

  ///! --DataSources-- ///
  getIt.registerLazySingleton<AuthRemoteDs>(() => AuthRemoteDsImpl(getIt()));
  getIt.registerLazySingleton<HomeRemoteDs>(() => HomeRemoteDsImpl(getIt()));
  getIt.registerLazySingleton<CartRemoteDs>(() => CartRemoteDsImpl(getIt()));

  getIt.registerLazySingleton<ProfileRemoteDs>(
      () => ProfileRemoteDsImpl(getIt()));
  getIt.registerLazySingleton<MyOrderRemoteDs>(
      () => MyOrderRemoteDsImpl(getIt()));
  getIt.registerLazySingleton<QuestionsRemoteDs>(
      () => QuestionsRemoteDsImpl(getIt()));

  getIt.registerLazySingleton<PrizeProductsRemoteDs>(
      () => PrizeProductsRemoteDsImpl(getIt()));
  getIt.registerLazySingleton<AddressRemoteDs>(
      () => AddressRemoteDsImpl(getIt()));

  /// !-- Repositories -- ///
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(getIt()));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(getIt()));
  getIt.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<OrdersRepository>(
      () => OrdersRepositoryImpl(getIt()));
  getIt
      .registerLazySingleton<CartRepository>(() => CartRepositoryImpl(getIt()));
  getIt.registerLazySingleton<QuestionsRepository>(
      () => QuestionsRepositoryImpl(getIt()));
  getIt.registerLazySingleton<PrizeProductsRepository>(
      () => PrizeProductsRepositoryImpl(getIt()));
  getIt.registerLazySingleton<AddressRepo>(() => AddressRepoImpl(getIt()));

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
  getIt.registerLazySingleton(() => GetCartItemsUseCase(getIt()));
  getIt.registerLazySingleton(() => AddToCartUseCase(getIt()));
  getIt.registerLazySingleton(() => RemoveFromCartUseCase(getIt()));
  getIt.registerLazySingleton(() => UpdateCartItemQuantityUseCase(getIt()));
  getIt.registerLazySingleton(() => GetQuestionsUseCase(getIt()));
  getIt.registerLazySingleton(() => ChangePasswordUseCase(getIt()));
  getIt.registerLazySingleton(() => LogoutUseCase(getIt()));
  getIt.registerLazySingleton(() => DeleteAccountUseCase(getIt()));

  getIt.registerLazySingleton(() => GetPrizeProductsUseCase(getIt()));
  getIt.registerLazySingleton(() => GetExtraPointsOptionsUseCase(getIt()));
  getIt.registerLazySingleton(() => GetUserPointsUseCase(getIt()));
  getIt.registerLazySingleton(() => RateAppUseCase(getIt()));
  getIt.registerLazySingleton(() => GetAllAddressUseCase(getIt()));
  getIt.registerLazySingleton(() => StoreAddressUseCase(getIt()));
  getIt.registerLazySingleton(() => DeleteAddressUseCase(getIt()));
  getIt.registerLazySingleton(() => CheckOutUseCase(getIt()));
  getIt.registerLazySingleton(() => SetLocationUseCase(getIt()));
  getIt.registerLazySingleton(() => VerifyEmailUseCase(getIt()));
  getIt.registerLazySingleton(() => ResendCodeUseCase(getIt()));

 getIt.registerLazySingleton(() => ForgetPasswordUseCase(getIt()));
  getIt.registerLazySingleton(() => VerifyForgetPasswordUseCase(getIt()));
  getIt.registerLazySingleton(() => ResetPasswordUseCase(getIt()));

  // !Cubits //
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerLazySingleton<RegisterCubit>(() => RegisterCubit(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt(), getIt(), getIt()));
  getIt.registerFactory(() => ProfileCubit(getIt(), getIt(), getIt(), getIt()));
  getIt.registerFactory(() => OrdersCubit(getIt()));
  getIt.registerFactory(() => OrderDetailsCubit(getIt()));
  getIt.registerFactory(() => CartCubit(
        getIt(),
        getIt(),
        getIt(),
        getIt(),
      ));
  getIt.registerFactory(() => QuestionsCubit(getIt()));
  getIt.registerFactory(() => ChangePasswordCubit(getIt()));
  getIt.registerFactory(() => PrizeProductsCubit(
        getPrizeProductsUseCase: getIt(),
        getExtraPointsOptionsUseCase: getIt(),
        getUserPointsUseCase: getIt(),
      ));

  getIt.registerFactory(() => RateAppCubit(getIt()));
  getIt.registerFactory(() => AddressCubit(
      getAllAddressUseCase: getIt(),
      storeAddressUseCase: getIt(),
      deleteAddressUseCase: getIt()));
  getIt.registerFactory(() => CheckOutCubit(getIt()));

  getIt
      .registerLazySingleton<SetLocationCubit>(() => SetLocationCubit(getIt()));
  getIt.registerLazySingleton<VerificationCubit>(() => VerificationCubit(getIt(), getIt()));
  getIt.registerFactory(() => PasswordResetCubit(
    getIt<ForgetPasswordUseCase>(),
    getIt<VerifyForgetPasswordUseCase>(),
    getIt<ResetPasswordUseCase>(),
  ));
}
