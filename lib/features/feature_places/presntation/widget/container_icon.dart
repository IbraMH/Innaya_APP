import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/core/app_colors.dart';

class ContainerIcon extends StatelessWidget {
  String image;
  int typeGender;

  ContainerIcon({
    required this.image,
    this.typeGender = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25.w,
      height: 25.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(3, 3), // changes position of shadow
          ),
        ],
      ),
      child: Image.asset(
        image,
        width: 17.w,
        height: 17.h,
        color: typeGender==1?titleStartPage:titleStartPage2,
      ),
    );
  }
}
