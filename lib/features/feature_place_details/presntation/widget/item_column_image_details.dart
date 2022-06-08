import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/widget/custome_text.dart';

class ItemColumnImageDetails extends StatelessWidget {
  String title;
  String image;
  int page;
  int typeGender;

  ItemColumnImageDetails({
    required this.title,
    required this.image,
    this.page = 1,
    this.typeGender = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          width: page==1?100.w:200.w,
          height: 100.h,
        ),
        SizedBox(height: 5.h),
        CustomeText(
          title: title,
          color: typeGender==1?titleStartPage:titleStartPage2,
          fontSize: 14.sp,
        ),
      ],
    );
  }
}
