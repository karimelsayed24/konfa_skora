import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductOptionsWidget extends StatefulWidget {
  const ProductOptionsWidget({super.key});

  @override
  _ProductOptionsWidgetState createState() => _ProductOptionsWidgetState();
}

class _ProductOptionsWidgetState extends State<ProductOptionsWidget> {
  final Map<String, bool> selectedOptions = {
    'إضافة كريمة': false,
    'إضافة فواكه إضافية': false,
    'شمع أرقام': false,
    'علبة هدية': false,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'الإضافات',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.right,
          ),
          SizedBox(height: 8.h),
          ...selectedOptions.entries.map(
            (entry) => _buildOptionItem(entry.key, entry.value),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionItem(String title, bool isSelected) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '15 ر.س',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[700],
            ),
          ),
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                ),
                textAlign: TextAlign.right,
              ),
              SizedBox(width: 8.w),
              Checkbox(
                value: isSelected,
                activeColor: Colors.red[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.r),
                ),
                onChanged: (bool? value) {
                  setState(() {
                    selectedOptions[title] = value!;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
