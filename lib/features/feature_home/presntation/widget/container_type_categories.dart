import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/utility/utility.dart';
import 'package:innaya_app/widget/custome_text.dart';

class ContainerTypeCategories extends StatelessWidget {
  String title;
  GestureTapCallback? pressCard;
  Color bGColor;
  double shadow;
  bool select;
  int typeGender;

  ContainerTypeCategories({
    required this.title,
    this.bGColor = Colors.white,
    this.shadow = 0,
    this.pressCard,
    this.select = false,
    this.typeGender = 1,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120.w,
      height: 50.h,
      child: GestureDetector(
        onTap: pressCard,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: select?bGColor:Utility.typeGender==1?BGroundCategoryHomePage:BGroundCategoryHomePageMen,
            borderRadius: BorderRadiusDirectional.only(topEnd: Radius.circular(10.r),topStart: Radius.circular(10.r)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(select?0.3:0),
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(0, -3), // changes position of shadow
              ),
            ],
          ),
          child: CustomeText(
            title: title,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: typeGender==1?titleStartPage:titleStartPage2,
          ),
        ),
      ),
    );
  }
}
