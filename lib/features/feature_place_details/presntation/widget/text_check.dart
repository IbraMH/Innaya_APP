import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/widget/custome_text.dart';

class TextCheck extends StatelessWidget {
  String title;
  int typeGender;

  TextCheck({
    required this.title,
    this.typeGender = 1,
  });

  @override
  Widget build(BuildContext context) {
    return CustomeText(
      title: title,
      fontSize: 14.sp,
      color: typeGender==1?titleStartPage:titleStartPage2,
      fontWeight: FontWeight.w900,
    );
  }
}
