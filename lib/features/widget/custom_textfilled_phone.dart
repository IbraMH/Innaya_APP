import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/core/app_font.dart';
import 'package:innaya_app/core/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomTextFilledPhone extends StatelessWidget {
  String? hintText;
  String ?iconsvg;
  String? lable;
  int? type=0;
  FormFieldValidator<String> ?validator;
  ValueChanged<String>? onChanged;
  TextEditingController? controller;
  String? introCode;
  String? initialCountry = 'SA';
  final GestureTapCallback? press;
  CustomTextFilledPhone({
    Key ?key,
    this.hintText,
    this.lable,
    this.iconsvg ,
    this.onChanged,
    this.controller,
    this.validator,
    this.type,
    this.introCode="+972",
    this.press
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
/*        Text(lable.tr,style:TextStyle(color: Colors.black,fontSize:14,fontWeight: FontWeight.bold),),
  //      SizedBox(height: 10,),*/
        TextFormField(
          controller: controller,
          onChanged: onChanged,
          validator: validator,
          keyboardType: TextInputType.phone,
          style:  TextStyle(color: Colors.black,fontFamily:FONT_CairoFont,fontSize: fontSize15.sp),
          textInputAction:TextInputAction.next ,
          cursorColor: kColorButtom,
          maxLength: 14,
        /*  inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
            _NumberTextInputFormatter(1),

          ],*/
          decoration: InputDecoration(

            counterText: "",
            labelText: lable!.tr,
            hintStyle:  TextStyle(color: Colors.grey[300],fontFamily:FONT_CairoFont,fontSize: fontSize15.sp),
            labelStyle:  TextStyle( color: kUnSelectTabColor,fontFamily:FONT_CairoFont,fontSize: fontSize15.sp),
            prefixIconConstraints: BoxConstraints(minWidth: 23, maxHeight: 20),
          /*  prefixIcon: GestureDetector(
              onTap:press ,
              child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child:Row(
                    mainAxisSize:MainAxisSize.min ,
                    children: [
                      Text(introCode!,style:TextStyle(color: Colors.black,fontSize:11,fontWeight: FontWeight.bold),),
                      SizedBox(width: 2,),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      )
                    ],
                  )),
            ),*/
            hintText: hintText!.tr,
            border: InputBorder.none,
          ),

        ),
      ],
    );
  }


}
class _NumberTextInputFormatter extends TextInputFormatter {
  int _whichNumber;
  _NumberTextInputFormatter(this._whichNumber);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = StringBuffer();
    switch (_whichNumber) {
      case 1:
        {
          if (newTextLength >= 1 ) {
            newText.write(' ');
            if (newValue.selection.end >= 1) selectionIndex++;
          }
          if (newTextLength >= 4 ) {
            newText.write(
                newValue.text.substring(0, usedSubstringIndex = 3) + '- ');
            if (newValue.selection.end >= 3) selectionIndex += 2;
          }
          if (newTextLength >= 7 ) {
            newText.write(
                newValue.text.substring(3, usedSubstringIndex = 6) + '-');
            if (newValue.selection.end >= 6) selectionIndex++;
          }
          if (newTextLength >= 11 ) {
            newText.write(
                newValue.text.substring(6, usedSubstringIndex = 10) + ' ');
            if (newValue.selection.end >= 10) selectionIndex++;
          }
          break;
        }
      case 91:
        {
          if (newTextLength >= 5) {
            newText.write(
                newValue.text.substring(0, usedSubstringIndex = 5) + ' ');
            if (newValue.selection.end >= 6) selectionIndex++;
          }
          break;
        }
    }
    // Dump the rest.
    if (newTextLength >= usedSubstringIndex)
      newText.write(newValue.text.substring(usedSubstringIndex));
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
