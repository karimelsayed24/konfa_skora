import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:konaf_skora/core/theme/app_colors.dart';

class QuantitySelectorWidget extends StatefulWidget {
  const QuantitySelectorWidget({super.key});

  @override
  _QuantitySelectorWidgetState createState() => _QuantitySelectorWidgetState();
}

class _QuantitySelectorWidgetState extends State<QuantitySelectorWidget> {
  int quantity = 1;

  void _increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          width: 125.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.add,
                    size: 24.sp,
                    color: Colors.white,
                  ),
                  onPressed: _increaseQuantity,
                ),
                Text(
                  '$quantity',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.remove,
                    size: 24.sp,
                    color: Colors.white,
                  ),
                  onPressed: _decreaseQuantity,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
