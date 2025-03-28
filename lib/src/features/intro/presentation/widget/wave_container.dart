import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:konaf_skora/core/theme/app_colors.dart';
import 'package:konaf_skora/src/features/intro/presentation/widget/wave_clipper.dart';
import 'package:konaf_skora/src/features/intro/presentation/widget/wave_painter.dart';

class WaveContainer extends StatelessWidget {
  final Color backgroundColor;
  final Color waveColor;
  final double height;

  const WaveContainer({
    super.key,
    this.backgroundColor = Colors.white,
    this.waveColor = Colors.white,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              color: waveColor,
              height: height,
            ),
          ),
          Positioned(
            top: -30.h,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 430.h,
              child: CustomPaint(
                size: Size(double.infinity, 100.h),
                painter: WavePainter(
                  waveColor: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
