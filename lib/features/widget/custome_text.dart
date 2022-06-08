import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innaya_app/core/app_font.dart';
class CustomeText extends StatelessWidget {
  final String?title;
  final Color? color;
  final double ?fontSize;
  final GestureTapCallback ?press;
  final int? weight;
  final String ?fontFamily;
  final int ?aligment;
  final int ?overflow;
  final int? maxLines;
  final double ?fontHeight;
  final FontWeight ?fontWeight;
  final TextAlign ?textAlign;
  final TextDecoration ?decoration;

  const CustomeText
      ({Key? key,this.maxLines,this.title,this.overflow, this.weight, this.color, this.fontSize,  this.press,this.fontFamily,this.aligment, this.fontHeight,this.fontWeight=FontWeight.normal,this.textAlign,this.decoration}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:press ,
      child: Text(title!.tr,style:TextStyle(    decoration: decoration,
          color: color,fontSize:fontSize,height: fontHeight,fontFamily:FONT_APP,fontWeight: fontWeight ),textAlign: textAlign??TextAlign.start,overflow:(overflow==null)?TextOverflow.visible: TextOverflow.ellipsis,maxLines: (maxLines==null)?null:maxLines,),
    );
  }
}
