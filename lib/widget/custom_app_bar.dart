import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/features/feature_home/presntation/view/home_screen.dart';
import 'package:innaya_app/features/feature_notifications/presntation/view/notification_screen.dart';

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
      padding: EdgeInsetsDirectional.only(start: 20.w,end: 20.w,top: 20.h,bottom: 10.h),
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
          GestureDetector(
            onTap: (){
              Get.offAll(HomeScreen(typeGender: typeGender));
            },
            child: Image.asset(
              typeGender == 1
                  ? 'assets/images/logo_home.png'
                  : 'assets/images/logo_home_men.png',
              width: 70.w,
              height: 70.h,
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: (){
              Get.to(NotificationScreen(typeGender: typeGender));
            },
            child: Image.asset(
              'assets/images/notification.png',
              width: 30.w,
              height: 30.h,
              color: typeGender == 1 ? titleStartPage : titleStartPage2,
            ),
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
