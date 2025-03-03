import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/services/service_locator.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_image_view.dart';
import '../../../../../core/utils/app_strings.dart';
import '../components/login_form.dart';
import '../logic/login/login_cubit.dart';
import '../widgets/create_account_title.dart';

class LoginViewSheet extends StatelessWidget {
  const LoginViewSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 20, top: 25),
                  child: CreateAccountTitle(
                    title: AppStrings.welcome,
                    subTitle: AppStrings.signIn,
                  ),
                ),
                Padding(
                  padding:
                   const   EdgeInsets.only(left: 20, bottom: 20, top: 32, right: 20),
                  child: BlocProvider(
                    create: (context) => getIt<LoginCubit>(),
                    child:const LoginForm(),
                  ),
                ),
              ],
            ),
            Positioned(
              left: -10,
              top: -10,
              child: AppImageView(
                AppAssets.sevenLines,
                width: 110.w,
                height: 110.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
