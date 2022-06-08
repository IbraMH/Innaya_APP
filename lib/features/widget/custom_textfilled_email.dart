import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/core/app_font.dart';
import 'package:innaya_app/core/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'custom_surfix_icon.dart';

class CustomTextFilledEmail extends StatelessWidget {
   String ?hintText;
   String ?iconsvg;
   String ?lable;
   int? type;
   FormFieldValidator<String> ?validator;
  ValueChanged<String>? onChanged;
    TextEditingController? controller;
   FocusNode ?focusNode;
    String ?fontFamily;


   CustomTextFilledEmail({
    Key ?key,
    this.hintText,
    this.lable,
     this.fontFamily,
     this.focusNode=null,
     this.type,
    this.iconsvg ,
    this.onChanged,
    this.controller,
    this.validator,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
     context
          
          ,
      designSize: Size(SCREEN_WIDTH, SCREEN_HIGHT),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
  /*      Text(lable.tr,style:TextStyle(color: Colors.black,fontSize:14,fontWeight: FontWeight.bold),),
        SizedBox(height: 10,),*/
        TextFormField(
        controller: controller,
        onChanged: onChanged,
          focusNode: focusNode,
          textInputAction:(type==null)?TextInputAction.next:TextInputAction.done ,

          keyboardType: TextInputType.emailAddress,
        validator: validator,
          style:  TextStyle(color: Colors.black,
              fontFamily: fontFamily??FONT_CairoFont,
              fontSize: fontSize15.sp),

          cursorColor: kColorButtom,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: lable!.tr,
          hintStyle:  TextStyle(      color: Colors.grey[300],fontFamily:  fontFamily??FONT_CairoFont,fontSize: fontSize15.sp),
          labelStyle:  TextStyle(      color: kUnSelectTabColor,fontFamily:  fontFamily??FONT_CairoFont,fontSize: fontSize15.sp),

          suffixIcon:(iconsvg!=null)?CustomSurffixIcon( svgIcon: iconsvg,):SizedBox(),
        hintText: hintText!.tr,
        border: InputBorder.none,
        ),

        ),
      ],
    );
    }


}
