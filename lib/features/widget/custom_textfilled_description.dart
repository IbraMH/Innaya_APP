import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/core/app_font.dart';
import 'package:innaya_app/core/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'custom_surfix_icon.dart';

class CustomTextFilledDescription extends StatelessWidget {

  String ?hintText;
   String? iconsvg;
   String? lable;
   final Color? color;
   final String ?fontFamily;
   final double ?fontSize;
   FormFieldValidator<String> ?validator;
   ValueChanged<String> ?onChanged;
   TextEditingController? controller;
   TextInputType? textInputType;
   int ?numberMaxLine;


   CustomTextFilledDescription({
    Key? key,
    this.hintText,
    this.lable,
    this.iconsvg ,
    this.onChanged,
    this.controller,
     this.numberMaxLine=7,
    this.validator,
    this.textInputType, this.color, this.fontFamily, this.fontSize,
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
        TextFormField(
          scrollPadding:EdgeInsets.all(0) ,
          textAlignVertical:TextAlignVertical.top ,
          textAlign: TextAlign.start,
          textInputAction:TextInputAction.newline ,
          controller: controller,
          textCapitalization: TextCapitalization.sentences,
          minLines: numberMaxLine,
          onChanged: onChanged,
          validator: validator,
          maxLength: null,
          style: new TextStyle(color: Colors.black,fontSize: fontSize,fontFamily: fontFamily ?? FONT_CairoFont),maxLines: numberMaxLine,
          keyboardType: TextInputType.multiline,
          cursorColor: kColorButtom,
          decoration: InputDecoration(
          alignLabelWithHint: true,
         labelText: lable!.tr,
            hintStyle: TextStyle(
                color: /*color ??*/ Colors.grey[300],
                fontSize: fontSize ?? fontSize15.sp,
                fontFamily: fontFamily ?? FONT_CairoFont),
            labelStyle: new TextStyle(color:kUnSelectTabColor,fontSize:fontSize == null? fontSize15 : (fontSize ) ,fontFamily: fontFamily ?? FONT_CairoFont),

          suffixIcon:(iconsvg!=null)?CustomSurffixIcon( svgIcon: iconsvg, type: null,):SizedBox(),
        hintText: hintText!.tr,
        border: InputBorder.none,
        ),

        ),
      ],
    );
    }


}
