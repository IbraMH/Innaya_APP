import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/widget/custome_text.dart';

class ItemRowConfirmDetails extends StatelessWidget {
  String? title;
  String subTitle;
  bool select;
  String? image;
  int typeGender;

  ItemRowConfirmDetails({
    this.title,
    required this.subTitle,
    this.select = false,
    this.image,
    this.typeGender = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 45.w,
          child: select
              ? Image.asset(
                  image!,
                  width: 25.w,
                  height: 25.h,
            color: typeGender==1?titleStartPage:titleStartPage2,
                )
              : CustomeText(
                  title: title,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w900,
                  color: typeGender==1?titleStartPage:titleStartPage2,
                ),
        ),
        CustomeText(
          title: subTitle,
          fontSize: select?14.sp:11.sp,
          color: select&&typeGender==1?titleStartPage:select&&typeGender==2?BGroundTextColorMen:Colors.grey.shade700,
          fontWeight: select?FontWeight.w900:FontWeight.bold,
          maxLines: 1,
          overflow: 1,
        ),
      ],
    );
  }
}
