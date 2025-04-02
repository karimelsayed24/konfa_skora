import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/common/widgets/custom_btn.dart';
import '../../../core/data/cached/cache_helper.dart';
import '../../../core/routes/router_names.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_image_view.dart';
import '../../../core/utils/app_strings.dart';


class AnimatedSplashScreen extends StatefulWidget {
  const AnimatedSplashScreen({super.key});

  @override
  State<AnimatedSplashScreen> createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _topAnimation;
  late Animation<double> _bottomAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    );

    _topAnimation = Tween<double>(
      begin: -1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _bottomAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    Future.delayed(const Duration(milliseconds: 500), () {
      _controller.forward();
    });
  }

  void navigateTo() async {
    String? value = CacheHelper.getToken();
    if (value != null) {
      context.go(RouterNames.bottomNavigationBarRoot);
    } else {
      context.go(RouterNames.landing);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          // Center Logo
          // const Center(
          //   child: AppImageView(
          //     AppAssets.blackLogo,
          //     width: 150,
          //     height: 150,
          //   ),
          // ),
          AnimatedBuilder(
            animation: _topAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0,
                    MediaQuery.of(context).size.height * _topAnimation.value),
                child: ClipPath(
                  clipper: CustomCurveClipper(),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    color: AppColors.primaryColor,
                    child: const Center(
                      child: AppImageView(
                        AppAssets.konafatSokara,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          // Bottom Button
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: AnimatedBuilder(
              animation: _bottomAnimation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                      0,
                      MediaQuery.of(context).size.height *
                          _bottomAnimation.value),
                  child: Center(
                      child: CustomButton(
                          text: AppStrings.next, onPressed: navigateTo)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 80);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height - 40);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width * 3 / 4, size.height - 80);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}