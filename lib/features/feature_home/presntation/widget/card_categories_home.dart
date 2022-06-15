import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/utility/utility.dart';
import 'package:innaya_app/widget/custome_text.dart';


class CardCategoriesHome extends StatelessWidget {
  String image;
  GestureTapCallback? pressCard;
  bool select;
  String title;
  int typeGender;

  CardCategoriesHome({
    required this.image,
    this.pressCard,
    this.select = false,
    required this.title,
    this.typeGender = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 5.w),
      child: SizedBox(
        width: 80.w,
        height: 70.h,
        child: GestureDetector(
          onTap: pressCard,
          child: Column(
            children: [
              Card(
                elevation: 0,
                color: select&&typeGender==1?titleStartPage:select&&typeGender==2?titleStartPage2:Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.r),
                  side: BorderSide(
                    width: 2,
                    color: typeGender==1?titleStartPage:titleStartPage2,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Image.network(
                    image,
                    width: 35.w,
                    height: 35.h,
                    color: select?Colors.white:typeGender==1?titleStartPage:titleStartPage2,
                  ),
                ),
              ),
              CustomeText(
                title: title,
                color:typeGender==1?titleStartPage:titleStartPage2,
                fontSize: 14.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
