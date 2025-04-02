import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:konaf_skora/core/app_cubit/app_cubit.dart';
import 'package:konaf_skora/core/routes/app_routers.dart';
import 'package:konaf_skora/core/services/service_locator.dart';
import 'package:easy_localization/easy_localization.dart';

import '../core/theme/app_themes.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 812),
      builder: (context, child) {
        return BlocProvider(
          create: (context) => getIt<AppCubit>(),
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: router,
            theme: AppTheme.lightTheme,
            
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
           builder: (context, child) {
              return EasyLocalization(
                supportedLocales: const [Locale('ar')],
                path: 'assets/translations',
                fallbackLocale: const Locale('ar'),
                child: child!,
              );
            },
          ),
        );
      },
    );
  }
}