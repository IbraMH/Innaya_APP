import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/core/app_images.dart';
import 'package:innaya_app/core/app_size.dart';
import 'package:innaya_app/features/widget/custome_text.dart';
import 'package:innaya_app/localization/lang/message.dart';
import 'package:innaya_app/utility/size_config.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';



class DialogCustomeLogin extends StatefulWidget {
  GestureTapCallback ?pressOk;
  GestureTapCallback ?pressCanecl;
  String? title;
  DialogCustomeLogin({this.pressOk,this.pressCanecl,this.title});

  @override
  _DialogUpdateState createState() => _DialogUpdateState();
}

class _DialogUpdateState extends State<DialogCustomeLogin> {
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
                height: getProportionateScreenWidth(24),
              ),
              //CustomeText(title:"Attention",color:kColorButtom,fontSize: 15,weight: 1,),
            /*  SizedBox(
                height: getProportionateScreenWidth(4),
              ),*/
              Image.asset(
                LOGOSPLASH,
                width: 100.w,
                height: 100.h,
                fit: BoxFit.contain,
              ),

              SizedBox(
                height:getProportionateScreenWidth(10),
              ),
              Flexible(child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: CustomeText(title:kPleaselogin,color:Colors.green,fontSize: 15,weight: 1,aligment: 1),
              )),
              SizedBox(
                height:getProportionateScreenWidth(25),
              ),
              Container(
                width: SizeConfig.screenWidth,
                color: kUnSelectTabColor,
                height: 0.5,
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
                        child:CustomeText(title:kSignIn,color: Colors.black,fontSize: 15,),

                        onPressed:widget.pressOk,
                    /*    shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: Colors.white)),*/
                      ),
                    ),
                  ),
                  Container(
                    width: 0.5,
                    color: kUnSelectTabColor,
                    height: getProportionateScreenWidth(45),),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(7),
                      height: getProportionateScreenWidth(29),
                      decoration: BoxDecoration(
                     //   borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: FlatButton(
                        color: Colors.white,
                        highlightColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child:CustomeText(title:kCancel.tr.toUpperCase(),color:kColorButtom,fontSize: 15,),

                        onPressed:widget.pressCanecl,
                     /*   shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: Colors.white))*/
                      ),
                    ),
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
