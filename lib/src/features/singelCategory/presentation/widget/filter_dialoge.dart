import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:konaf_skora/core/common/widgets/custom_btn.dart';
import 'package:konaf_skora/core/theme/app_colors.dart';

// This would be the filter bottom sheet
class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({Key? key}) : super(key: key);

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  int _selectedFilterOption = 0;
  RangeValues _currentRangeValues = const RangeValues(100, 500);

  final List<String> _filterOptions = [
    'الاسم من الألف إلى الياء',
    'الاسم من الياء إلى الألف',
    'السعر من الأعلى إلى الأدنى',
    'السعر من الأدنى إلى الأعلى'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Handle indicator
          Center(
            child: Container(
              width: 50.w,
              height: 5.h,
              margin: EdgeInsets.only(bottom: 16.h),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2.5.r),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.delete_outline, color: Colors.red, size: 24.r),
                onPressed: () {
                  setState(() {
                    _selectedFilterOption = 0;
                    _currentRangeValues = const RangeValues(100, 500);
                  });
                },
              ),
              Text(
                'فرز حسب',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          Divider(thickness: 1.h),
          for (int i = 0; i < _filterOptions.length; i++)
            _buildRadioOption(i, _filterOptions[i]),
          SizedBox(height: 8.h),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'نطاق السعر',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
              textAlign: TextAlign.right,
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 100.w,
                padding: EdgeInsets.symmetric(vertical: 8.h),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: Text(
                    _currentRangeValues.end.round().toString(),
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ),
              ),
              Text('-', style: TextStyle(fontSize: 16.sp)),
              Container(
                width: 100.w,
                padding: EdgeInsets.symmetric(vertical: 8.h),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: Text(
                    _currentRangeValues.start.round().toString(),
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          // Price range slider
          RangeSlider(
            values: _currentRangeValues,
            min: 0,
            max: 1000,
            divisions: 100,
            onChanged: (RangeValues values) {
              setState(() {
                _currentRangeValues = values;
              });
            },
            activeColor: AppColors.primaryColor,
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: double.infinity,
            height: 50.h,
            child: CustomButton(
              height: 50.h,
              text: 'تطبيق',
              onPressed: () {
                Navigator.of(context).pop({
                  'sortOption': _selectedFilterOption,
                  'priceRange': _currentRangeValues,
                });
              },
            ),
          ),
          SizedBox(height: 60.h),
        ],
      ),
    );
  }

  Widget _buildRadioOption(int value, String text) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedFilterOption = value;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              text,
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 14.sp),
            ),
            Radio<int>(
              value: value,
              groupValue: _selectedFilterOption,
              onChanged: (int? newValue) {
                setState(() {
                  _selectedFilterOption = newValue!;
                });
              },
              activeColor: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
