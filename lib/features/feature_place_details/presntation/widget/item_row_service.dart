import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/widget/custome_text.dart';

class ItemRowService extends StatelessWidget {
  String title;
  String image;
  String details;
  int typeGender;

  ItemRowService({
    required this.title,
    required this.image,
    required this.details,
    this.typeGender = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Image.asset(
          image,
          width: 25.w,
          height: 25.h,
          color: typeGender==1?titleStartPage:titleStartPage2,
        ),
        SizedBox(width: 5.w),
        CustomeText(
          title: title,
          color: typeGender==1?titleStartPage:titleStartPage2,
          fontSize: 12.sp,
        ),
        SizedBox(width: 5.w),
        CustomeText(
          title: details,
          color: Colors.grey.shade600,
          fontSize: 12.sp,
        ),
      ],
    );
  }
}
