import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/widget/custome_text.dart';

class ContainerBtnConfirm extends StatelessWidget {
  String title;
  GestureTapCallback? presCard;
  int typeGender;


  ContainerBtnConfirm({
    required this.title,
    this.presCard,
    this.typeGender = 1,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: presCard,
      child: Container(
        height: 42.h,
        width: 160.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          gradient: LinearGradient(
              colors: [typeGender==1?Color(0xff6D096D):Color(0xff1A1A1A),typeGender==1?Color(0xffFAC5DC):Color(0xffCCCCCC)],
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: CustomeText(
          title: title,
          color: Colors.white,
          fontSize: 18.sp,
        ),
      ),
    );
  }
}