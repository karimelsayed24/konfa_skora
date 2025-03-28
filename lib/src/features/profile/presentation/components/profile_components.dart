import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../logic/profile_cubit.dart';
import '../logic/profile_state.dart';
import '../widgets/profile_menu_item.dart';

class ProfileComponents extends StatelessWidget {
  const ProfileComponents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<ProfileCubit>().getProfile();

    return Column(
      children: [
        BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
            state.whenOrNull(
              loaded: (data) => Container(
                width: 128.r,
                height: 128.r,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: CachedNetworkImage(
                  imageUrl: data.image ?? '',
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ) ?? 
            SizedBox(height: 10.r),
                          
           
             
                    ],
                  ),
                  SizedBox(height: 10.r),
                  state.whenOrNull(
                        loaded: (data) => Text(
                          '${data.firstName} ${data.lastName}',
                          style: AppStyles.s16.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                      ) ??
                      Text(
                        "no name",
                        style:
                            AppStyles.s16.copyWith(color: AppColors.greyText),
                      ),
                  const SizedBox(height: 4),
                  state.whenOrNull(
                        loaded: (data) => Text(
                          data.email,
                          style: AppStyles.s10.copyWith(
                            color: AppColors.greyText,
                          ),
                        ),
                      ) ??
                      Text(
                        'mg2*****@gmail.com',
                        style:
                            AppStyles.s10.copyWith(color: AppColors.secondGrey),
                      ),
                ],
              ),
            );
          },
        ),

        // Menu Items
        const Expanded(
          child: ProfileMenuItems(),
        ),
      ],
    );
  }
}
