import 'dart:io';

import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/core/app_size.dart';
import 'package:innaya_app/features/widget/custome_text.dart';
import 'package:innaya_app/localization/lang/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class ItemChooseCover extends StatelessWidget {
   ItemChooseCover({Key? key,this.pressChooseImage,this.imageCover}) : super(key: key);
   GestureTapCallback? pressChooseImage;
    String ?imageCover;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
     context
          
          ,
      designSize: Size(SCREEN_WIDTH, SCREEN_HIGHT),
    );
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              CustomeText(
                title: kCoverPhoto,
                textAlign: TextAlign.start,
                color:Colors.black,
                fontSize: fontSize15.sp,
              ),
              SizedBox(width: 5.w,),
              FloatingActionButton(
                backgroundColor: kColorPrimary,
                foregroundColor: Colors.white,
                hoverColor: Colors.white,
                focusColor: Colors.white,
                onPressed: pressChooseImage,
                heroTag: '${kCoverPhoto.tr}',
                tooltip: '${kCoverPhoto.tr}',
                child: const Icon(Icons.photo),
              ),
            ],
          ),
        /*  (file==null)?(imageCover==null)?SizedBox():SizedBox(
              height: 120,
              child: Image.network(imageCover!)):SizedBox(
              height: 120,
              child: Image.file(File(file!.path)))*/
        ],
      ),
    );
  }
}
