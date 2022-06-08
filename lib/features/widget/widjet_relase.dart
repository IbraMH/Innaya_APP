
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/core/app_font.dart';
import 'package:innaya_app/localization/lang/message.dart';
import 'package:innaya_app/utility/size_config.dart';

import 'custome_text.dart';

Widget Loading() {
  return Center(
    child: Image.asset(
      'assets/icons/loading.gif',
      width: getProportionateScreenWidth(50),
      height: getProportionateScreenWidth(50),
    ),
  );
}

class WidjetRelase {



  Widget Loading() {
    return Center(
      child: Image.asset(
        'assets/icons/loading.gif',
        width: getProportionateScreenWidth(50),
        height: getProportionateScreenWidth(50),
      ),
    );
  }
  Widget NotDataProduct() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SvgPicture.asset(
            'assets/icons/no_result.svg',
            width: getProportionateScreenWidth(70),
            height: getProportionateScreenWidth(110),
          ),
        ),
        SizedBox(height: 12,),
        CustomeText(title: kNoResults!.tr,fontSize: 20 , fontFamily: FONT_APP,color: Color(0xFFAFAFAF),),
      ],
    );
  }




  Widget noData() {
    return Container(
      height: SizeConfig.screenHeight,
      alignment: Alignment.center,
      width: SizeConfig.screenWidth,
      padding: EdgeInsets.all(10),
      child: SizedBox(
          height: SizeConfig.screenHeight! * 0.2,
          child: CustomeText(
            title: kNodata, press: null,
          )),
    );
  }

  AppBar appBar({String ?title,bool isBack=false}) {
    return AppBar(
        centerTitle: true,
        title: Text(
          title!.tr,
          style: TextStyle(color:Colors.black, fontFamily: FONT_APP,fontSize: 18),
        ),
      backgroundColor: kColorPrimary,
      actions: [
        isBack?GestureDetector(
        onTap: (){
          Get.back();
        },
        child: Icon(Icons.arrow_back_ios)):SizedBox(),
      ],
    );
  }




}
Widget NoInternet() {
  return Container(
    height: SizeConfig.screenHeight,
    alignment: Alignment.center,
    padding: EdgeInsets.all(10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomeText(
          title: kNo_Intenet.tr,
          fontSize: 16, press: null,
        ),
        SizedBox(
          height: 10,
        ),
        /* SizedBox(
            width: SizeConfig.screenWidth * 0.35,
            child: ReoundButtom(
              title: kSignIn,
              press: () {
                Get.to(Login());
              },
            ),
          ),*/
      ],
    ),
  );
}