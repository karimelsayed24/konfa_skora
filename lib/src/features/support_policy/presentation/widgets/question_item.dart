
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../data/model/question_response.dart';

class QuestionItem extends StatefulWidget {
  final QuestionModel question;

  const QuestionItem({super.key, required this.question});

  @override
  State<QuestionItem> createState() => _QuestionItemState();
}

class _QuestionItemState extends State<QuestionItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.r),
       border: Border.all(color: AppColors.borderGrey)
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              widget.question.question,
              style:  TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500),
              textAlign: TextAlign.right,
            ),
            trailing: Icon(
              _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: AppColors.primaryColor,
            ),
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
          ),
          if (_isExpanded)
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  widget.question.answer,
                  style: const TextStyle(color: AppColors.grey),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
        ],
      ),
    );
  }
}