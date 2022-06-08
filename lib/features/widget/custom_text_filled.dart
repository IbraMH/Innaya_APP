import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/core/app_font.dart';
import 'package:innaya_app/core/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'custom_surfix_icon.dart';

class CustomTextFilled extends StatelessWidget {
  String? hintText;
  String ?iconsvg;
  String? lable;
  final String ?fontFamily;
  final double? fontSize;
  FormFieldValidator<String>? validator;
  ValueChanged<String> ?onChanged;
  TextEditingController? controller;
  TextInputType? textInputType;
  FocusNode ?focusNode;
  final Color? color;
  final bool ?isCapitalize;
  final int?maxLine;
  final TextInputAction ?textInputAction;
  var formater;
  CustomTextFilled(
      {Key? key,
        this.hintText,
        this.lable,
        this.iconsvg,
        this.onChanged,
        this.controller,
        this.validator,
        this.textInputType,
        this.focusNode,
        this.isCapitalize = false,
        this.fontFamily,
        this.fontSize,
        this.color,
        this.maxLine,
        this.textInputAction, this.formater})
      : super(key: key);

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
        /*    Text(lable.tr,style:TextStyle(color: Colors.black,fontSize:14,fontWeight: FontWeight.bold),),
        SizedBox(height: 10,),*/
        TextFormField(
          focusNode: (focusNode == null) ? null : focusNode,
          enabled: (focusNode == null) ? true : false,
          textInputAction: textInputAction ?? TextInputAction.next,
          controller: controller,
          maxLines: maxLine ?? 1,
          onChanged: onChanged,
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          /*textCapitalization: isCapitalize
              ? TextCapitalization.sentences
              : TextCapitalization.none,*/
          textCapitalization: TextCapitalization.sentences,

          validator: validator,
          style: TextStyle(
              color: Colors.black,
              fontSize: fontSize15,
              fontFamily: fontFamily ?? FONT_CairoFont),
          keyboardType:
          (textInputType == null) ? TextInputType.text : textInputType,
          cursorColor: kColorButtom,
          decoration: InputDecoration(
            alignLabelWithHint: true,
            labelText: lable!.tr,
            hintStyle: TextStyle(
                color: /*color ??*/ Colors.grey[300],
                fontSize: fontSize == null ? fontSize15 : (fontSize),
                fontFamily: fontFamily ?? FONT_CairoFont),
            labelStyle: TextStyle(
              color: kUnSelectTabColor,
              /*color: color ?? (focusNode!= null && focusNode.hasFocus)?kColorButtom:Colors.grey[300],*/
              fontSize: fontSize == null ? fontSize15 : (fontSize ),
              fontFamily: fontFamily ?? FONT_CairoFont,
            ),
            suffixIcon: (iconsvg != null)
                ? CustomSurffixIcon(
              svgIcon: iconsvg,
              type: null,
            )
                : SizedBox(),
            hintText: hintText!.tr,
            border: InputBorder.none,
          ),
// inputFormatters: [formater],
        ),
      ],
    );
  }
}
