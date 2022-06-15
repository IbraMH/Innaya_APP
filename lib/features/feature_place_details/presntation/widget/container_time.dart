import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/widget/custome_text.dart';

class ContainerTime extends StatelessWidget {
  String title;
  bool select;
  GestureTapCallback? presCard;
  int typeGender;

  ContainerTime({
    required this.title,
    this.select = false,
    this.presCard,
    this.typeGender = 1,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: presCard,
      child: Container(
        width: 105.w,
        height: 35.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: select&&typeGender==1?BGroundCategoryHomePageMen2:select&&typeGender==2?BGroundCategoryHomePageMen2:Colors.white,
          borderRadius: BorderRadius.circular(25.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: CustomeText(
          title: title,
          fontSize: 12.sp,
          color: select?Colors.white:typeGender==1?BGroundCategoryHomePageMen2:BGroundCategoryHomePageMen2,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
