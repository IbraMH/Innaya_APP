import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/widget/custom_textfilled_app.dart';
import 'package:innaya_app/widget/custome_btn.dart';
import 'package:innaya_app/widget/custome_text.dart';

class AlertDialogMapFun extends StatefulWidget {
  
  @override
  State<AlertDialogMapFun> createState() => _AlertDialogMapFunState();
}

class _AlertDialogMapFunState extends State<AlertDialogMapFun> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: BGroundStartPage,//widget.typeGender==1?BGDate:BGDateMen,
      insetPadding: EdgeInsets.symmetric(horizontal: 30.w),
      contentPadding: EdgeInsets.zero,
      // buttonPadding: EdgeInsets.only(left: 15,right: 15,bottom: 5),
      elevation: 5,
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Container(
          height: 200.h,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Image.asset('assets/images/map2.jpg',width: double.infinity,height: double.infinity,fit: BoxFit.cover,isAntiAlias: true),
        ),
      ),
    ); //showAlertDialog(context);
  }
}
