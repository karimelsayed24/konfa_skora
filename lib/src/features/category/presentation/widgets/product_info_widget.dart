import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../home/presentation/logic/favorite/favorite_cubit.dart';
import '../../../home/presentation/logic/favorite/favorite_state.dart';

class ProductInfoWidget extends StatefulWidget {
  const ProductInfoWidget({
    super.key,
    required this.title,
    required this.price,
    required this.avgRate,
    required this.id,
    required this.initialIsFavorite,
  });
  final String title;
  final String price;
  final String avgRate;
  final int id;
  final bool initialIsFavorite;
  @override
  State<ProductInfoWidget> createState() => _ProductInfoWidgetState();
}

class _ProductInfoWidgetState extends State<ProductInfoWidget> {
  

  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    // Initialize with the initial favorite state
    _isFavorite = widget.initialIsFavorite;
  }

  void _toggleFavorite() {
    context.read<FavoriteCubit>().addFavorite(widget.id);
  }

 
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: AppStyles.s24,
              textAlign: TextAlign.right,
            ),
            BlocConsumer<FavoriteCubit, FavoriteState>(
              listener: (context, state) {
                state.maybeWhen(
                  loaded: (isFavorite) {
                    setState(() {
                      _isFavorite = isFavorite;
                    });
                  },
                  orElse: () {},
                );
              },
              builder: (context, state) {
                return Container(
                  height: 45.h,
                  width: 45.w,
                  decoration: BoxDecoration(
                    color: AppColors.filterGrey,
                    borderRadius: BorderRadius.circular(14.r),
                    border:
                        Border.all(color: AppColors.borderGrey, width: .5.w),
                  ),
                  child: InkWell(
                    onTap: _toggleFavorite,
                    child: Icon(
                      _isFavorite ? Icons.favorite : Icons.favorite_border,
                      size: 20.r,
                      color:
                          _isFavorite ? AppColors.primaryColor : AppColors.grey,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.amber),
            Text(
              '5/ ${widget.avgRate}',
              style: AppStyles.s15.copyWith(
                color: AppColors.grey,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              widget.price,
              style: AppStyles.s20.copyWith(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 4.w),
            Text(
              'ر.س',
              style: AppStyles.s20.copyWith(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
