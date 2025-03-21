import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:konaf_skora/core/common/functions/validator.dart';

import '../../../../../core/common/widgets/custom_text_form_field.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import 'auth_text_field_widget.dart';

class PhoneAndDateRow extends StatefulWidget {
  const PhoneAndDateRow(
      {super.key, required this.phoneController, required this.dateController});
  final TextEditingController phoneController;
  final TextEditingController dateController;

  @override
  State<PhoneAndDateRow> createState() => _PhoneAndDateRowState();
}

class _PhoneAndDateRowState extends State<PhoneAndDateRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AuthTextFieldWidget(
            isPassword: false,
            controller: widget.phoneController,
            hintText: AppStrings.phone,
            validator: Validator.validatePhone,
          ),
        ),
        SizedBox(width: 5.w),
        Expanded(
          child: _buildTextField(
            controller: widget.dateController,
            hintText: 'xx/xx/xxxx',
            prefixIcon: Icons.calendar_today_outlined,
            readOnly: true,
            onTap: () => _selectDate(context),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    return Container(
      height: 60.h,
      margin: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        onTap: onTap,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: AppStyles.s12.copyWith(
            color: AppColors.grey,
          ),
          fillColor: AppColors.white,
          hintText: hintText,
          prefixIcon: Icon(prefixIcon, size: 25.r, color: AppColors.iconColor),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.red.shade300,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        widget.dateController.text = _formatDate(picked.toString());
      });
    }
  }

  String _formatDate(String dateString) {
    final date = DateTime.parse(dateString);
    return DateFormat('yyyy-MM-dd').format(date);
  }
}
