import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/core/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  int typeGender;
  GestureTapCallback? pressCard;
  GestureTapCallback? pressMenu;

  CustomAppBar({
    this.typeGender = 1,
    this.pressCard,
    this.pressMenu,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: pressMenu,
            child: Image.asset(
              'assets/images/menu.png',
              width: 25.w,
              height: 25.h,
              color: typeGender == 1 ? titleStartPage : titleStartPage2,
            ),
          ),
          Spacer(),
          Image.asset(
            typeGender == 1
                ? 'assets/images/logo_home.png'
                : 'assets/images/logo_home_men.png',
            width: 70.w,
            height: 70.h,
          ),
          Spacer(),
          Image.asset(
            'assets/images/search.png',
            width: 25.w,
            height: 25.h,
            color: typeGender == 1 ? titleStartPage : titleStartPage2,
          ),
          SizedBox(width: 15.w),
          GestureDetector(
            onTap: pressCard,
              child: Image.asset(
            'assets/images/backAB.png',
            width: 25.w,
            height: 25.h,
                color: typeGender == 1 ? titleStartPage : titleStartPage2,
          ))
        ],
      ),
    );
  }
}
