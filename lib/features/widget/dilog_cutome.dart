import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/core/app_font.dart';
import 'package:innaya_app/core/app_images.dart';
import 'package:innaya_app/core/app_size.dart';
import 'package:innaya_app/localization/lang/message.dart';
import 'package:innaya_app/utility/size_config.dart';
import 'package:innaya_app/utility/utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'RoundButtomLoading.dart';
import 'custome_text.dart';

class DialogCustome extends StatefulWidget {
  GestureTapCallback? pressOk;
  GestureTapCallback? pressAddRating;
  GestureTapCallback? pressOpenWhats;
  GestureTapCallback? pressOpenPhone;
  ValueChanged<double>? onRatingUpdate;
  final bool? isTwoBtn;
  final bool? isShowWhats;
  String? title;
  DialogCustome(
      {this.pressOk,
      this.pressAddRating,
      this.title,
      this.isTwoBtn = false,
      this.onRatingUpdate,
        this.isShowWhats=false,
        this.pressOpenPhone,
      this.pressOpenWhats});

  @override
  _DialogUpdateState createState() => _DialogUpdateState();
}

class _DialogUpdateState extends State<DialogCustome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
     context
          
          ,
      designSize: Size(SCREEN_WIDTH, SCREEN_HIGHT),
    );
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
          //padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16), vertical: getProportionateScreenWidth(16)),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 24.h,
              ),
              //CustomeText(title:"Attention",color:kColorButtom,fontSize: 15,weight: 1,),
              /*  SizedBox(
                height: getProportionateScreenWidth(4),
              ),*/
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomeText(
                      title: widget.title!.tr,
                      color: kColorPrimary,
                      textAlign: TextAlign.center,
                      fontSize: fontSize15.sp,
                      weight: 1,
                      aligment: 1,
                      fontFamily: FONT_APP,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        (widget.isShowWhats!)?  GestureDetector(
                          onTap: widget.pressOpenWhats!,
                            child: Padding(
                              padding:  EdgeInsets.only(left: 20.w,right: 20.w),
                              child: Image.asset(
                          ICON_Whats!,
                          height: 55.w,
                          width: 55.w,
                        ),
                            )):SizedBox(),
                        SizedBox(width: 10.w,),
                        GestureDetector(
                            onTap: widget.pressOpenPhone!,
                            child: Padding(
                              padding:  EdgeInsets.only(left: 20.w,right: 20.w),
                              child: Image.asset(
                                ICON_Phone!,
                                height: 55.w,
                                width: 55.w,
                              ),
                            )),
                        SizedBox(width: 10.w,),
                        GestureDetector(
                            onTap: (){
                       //       makePhoneCall("");

                            },
                            child: Padding(
                              padding:  EdgeInsets.only(left: 20.w,right: 20.w),
                              child: Image.asset(
                                IMAGE_mobile_call!,
                                height: 55.w,
                                width: 55.w,
                              ),
                            )),

                      ],
                    ),
                    /*  Obx(() {
                        return RatingBar.builder(
                          initialRating:widget.AdsControllerx!.ratingOffer.value.toDouble(),
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate:widget.onRatingUpdate!,
                        );
                      }
                    )*/
                  ],
                ),
              )),

              SizedBox(
                height: fontSize25.sp,
              ),
              Container(
                width: SizeConfig.screenWidth,
                color: kUnSelectTabColor,
                height: 0.5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(5),
                      height: getProportionateScreenWidth(29),
                      decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: FlatButton(
                        highlightColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        color: Colors.white,
                        child: CustomeText(
                          title: kClose.tr.toUpperCase(),
                          color: Colors.black,
                          fontSize: 15,
                        ),
                        onPressed: widget.pressOk,
                        /*    shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: Colors.white)),*/
                      ),
                    ),
                  ),
                  Container(
                    width: 0.5,
                    color: kUnSelectTabColor,
                    height: getProportionateScreenWidth(45),
                  ),
                  (!widget.isTwoBtn!)
                      ? SizedBox()
                      : Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(7),
                              height: getProportionateScreenWidth(29),
                              decoration: BoxDecoration(
                                //   borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                              ),
                              child: Obx(() {
                                return RoundButtomLoading(
                                    title: kAddReview.tr,
                                    press: widget.pressAddRating!,
                                    state: 1,
                                    colore: kColorButtom);
                              })),
                        ),
                ],
              ),
              SizedBox(
                width: getProportionateScreenWidth(12),
              ),
            ],
          )),
    );
  }
}
