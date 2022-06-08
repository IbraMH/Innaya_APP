import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/widget/custome_text.dart';


class CustomeBtn extends StatelessWidget {
  String title;
  GestureTapCallback? pressBtn;
  Color btnColor;
  double widthBtn;
  double heightBtn;
  double fontSize;

  CustomeBtn({
    required this.title,
    this.pressBtn,
    this.btnColor = Colors.black,
    this.widthBtn = 100,
    this.heightBtn = 40,
    this.fontSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: pressBtn,
      style: ElevatedButton.styleFrom(
          primary: btnColor,
          alignment: Alignment.center,
          padding: EdgeInsets.zero,
          minimumSize: Size(widthBtn.w, heightBtn.h)),
      child: CustomeText(
        title: title,
        fontSize: fontSize.sp,
        color: Colors.white,
      ),
    );
  }
}
