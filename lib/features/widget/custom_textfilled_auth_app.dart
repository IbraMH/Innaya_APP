
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/core/app_font.dart';
import 'package:innaya_app/core/app_size.dart';


class CustomTextFilledAuthApp extends StatefulWidget {
  String ?hintText;
  String ?suffixIcon;
  String ?lable;
  int? type;
  FormFieldValidator<String> ?validator;
  ValueChanged<String>? onChanged;
  TextEditingController? controller;
  FocusNode ?focusNode;
  String ?fontFamily;
  TextInputType? textInputType;
  bool obscureText;
  double paddingIcon;
  bool readOnly;
  GestureTapCallback? pressCard;
  double widthTextField;
  double heightTextField;


  CustomTextFilledAuthApp({
    Key ?key,
    this.hintText,
    this.lable,
    this.fontFamily,
    this.focusNode=null,
    this.type,
    this.suffixIcon ,
    this.onChanged,
    this.controller,
    this.validator,
    this.textInputType = TextInputType.emailAddress,
    this.obscureText = false,
    this.paddingIcon = 15,
    this.readOnly = false,
    this.pressCard,
    this.heightTextField = 50,
    this.widthTextField = 280,
  }) : super(key: key);

  @override
  State<CustomTextFilledAuthApp> createState() => _CustomTextFilledAuthAppState();
}

class _CustomTextFilledAuthAppState extends State<CustomTextFilledAuthApp> {

bool _passwordVisible=false;
  @override
  void initState() {
   if(widget.obscureText){
     _passwordVisible=true;
   }else{
     _passwordVisible=false;

   }
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(SCREEN_WIDTH, SCREEN_HIGHT),
    );
    return Container(
      // height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
        gradient: LinearGradient(
            colors: [Color(0xffF4EAF3),Color(0xffFEFEFE)],
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /*      Text(lable.tr,style:TextStyle(color: Colors.black,fontSize:14,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),*/
          GestureDetector(
            onTap: widget.pressCard,
            child: TextFormField(
              controller: widget.controller,
              onChanged: widget.onChanged,
              focusNode: widget.focusNode,
              readOnly: widget.readOnly,
              // textInputAction:(type==null)?TextInputAction.next:TextInputAction.done ,

              keyboardType: widget.textInputType,
              obscureText: _passwordVisible,
              validator: widget.validator,
              style:  TextStyle(color: Colors.black,
                  fontFamily: widget.fontFamily??FONT_APP,
                  fontSize: fontSize15.sp),

              cursorColor: BGroundCardHomePage,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.transparent,
                labelText: widget.lable!,

                hintStyle:  TextStyle(      color: Colors.grey[300],fontFamily:  widget.fontFamily??FONT_APP,fontSize: fontSize15.sp,),
                labelStyle:  TextStyle(      color: kUnSelectTabColor,fontFamily:  widget.fontFamily??FONT_APP,fontSize: fontSize15.sp,),

                prefixIcon: Padding(
                    padding: EdgeInsets.only(right: widget.paddingIcon.w, left: widget.paddingIcon.w),
                    child: Image.asset(widget.suffixIcon!,width: 20.w,height: 20.h,)//SvgPicture.asset(ICON_SEARCH,color: Colors.white,),
                ),
                suffixIcon: (widget.obscureText)?IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    _passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ):SizedBox(),
                hintText: widget.hintText!,
                // border: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(10.w),
                //     borderSide: BorderSide(width: 0.5,color: kSearchFiledColor)
                // ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.w),
                    borderSide: BorderSide(width: 0.5,color: kSearchFiledColor)
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.w),
                  borderSide: BorderSide(width: 0.5,color: kSearchFiledColor),
                ),

              ),

            ),
          ),
        ],
      ),
    );
  }
}