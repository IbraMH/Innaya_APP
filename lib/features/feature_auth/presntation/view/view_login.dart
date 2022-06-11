import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/core/app_font.dart';
import 'package:innaya_app/core/app_images.dart';
import 'package:innaya_app/features/feature_auth/controller/login_controller.dart';
import 'package:innaya_app/features/feature_auth/presntation/view/view_register.dart';
import 'package:innaya_app/features/widget/RoundButtomLoading.dart';
import 'package:innaya_app/features/widget/custom_textfilled_auth_app.dart';

import 'package:innaya_app/localization/lang/message.dart';import 'package:innaya_app/widget/custome_text.dart';

import '../../../feature_home/presntation/view/home_screen.dart';
import 'view_forget_pass.dart';

class ViewLogin extends StatefulWidget {
  final int typeGender;
  const ViewLogin({Key? key,this.typeGender=1}) : super(key: key);
  @override
  State<ViewLogin> createState() => _ViewLoginState();
}

class _ViewLoginState extends State<ViewLogin> {
  TextEditingController? _textEditingControllerPhoneNumber;
  TextEditingController? _textEditingControllerPassword;
  TapGestureRecognizer? _tapGestureRecognizer;
  bool onChange = false;

  GlobalKey<FormState>? _fromKey;

  final LoginControllerx=Get.put(LoginController());
  String password="";
  @override
  void initState() {
    // TODO: implement initState
    _fromKey = GlobalKey<FormState>();
    _textEditingControllerPhoneNumber = TextEditingController();
    _textEditingControllerPassword = TextEditingController();
  /*  setState(() {
      _tapGestureRecognizer = TapGestureRecognizer()..onTap = goToSignUp;
    });*/
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _textEditingControllerPhoneNumber!.dispose();
    _textEditingControllerPassword!.dispose();
    super.dispose();
  }

  void goToSignUp() {
/*    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RegisterScreen()));*/
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BGroundStartPage,
        body: SingleChildScrollView(
          child:    Form(
            key: _fromKey,
            child: Padding(
              padding:  EdgeInsets.all(40.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30.h),
                  Image.asset(
                    'assets/images/title.png',
                    width: 120.w,
                    height: 40.h,
                  ),
                  SizedBox(height: 20.h),
                  Image.asset(
                    (widget.typeGender==2)?LOGOSPLASH:"assets/images/logo_men.png",
                    width: double.infinity,
                    height: 200.h,
                  ),
                  SizedBox(height: 15.h),
                  Image.asset(
                    'assets/images/title1.png',
                    width: 220.w,
                    height: 30.h,
                    color: titleStartPage,
                  ),
                  Image.asset(
                    'assets/images/title2.png',
                    width: 220.w,
                    height: 35.h,
                    color: titleStartPage,
                  ),
                  SizedBox(height: 40.h),
                  Image.asset(
                    'assets/images/title3.png',
                    width: 240.w,
                    height: 40.h,
                    color: titleStartPage,
                  ),
                  SizedBox(height: 30.h),
                  CustomTextFilledAuthApp(
                    lable: 'اسم المستخدم',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return kFiledNullError.tr;
                      } /*else if (!GetUtils.isEmail(value)) {
          return kInvalidEmailError.tr;
        }*/
                      return null;
                    },
                    controller: _textEditingControllerPhoneNumber,
                    suffixIcon: 'assets/images/user.png',
                    hintText: 'اسم المستخدم',
                    textInputType: TextInputType.name,
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: CustomTextFilledAuthApp(
                          lable: 'كلمة المرور',
                          controller: _textEditingControllerPassword,
                          suffixIcon: 'assets/images/lock.png',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return kFiledNullError.tr;
                            } /*else if (!GetUtils.isEmail(value)) {
          return kInvalidEmailError.tr;
        }*/
                            return null;
                          },
                          hintText: 'كلمة المرور',
                          textInputType: TextInputType.visiblePassword,
                          obscureText: true,
                        ),
                      ),
                      SizedBox(width: 30.w),
                      Column(
                        children: [
                          SizedBox(
                              width: 30.w,
                              height: 30.h,
                              child: Checkbox(
                                value: onChange,
                                onChanged: (value) {
                                  setState(() {
                                    if(onChange==false){
                                      onChange = true;
                                    }else{
                                      onChange = false;
                                    }
                                  });
                                },
                              )),
                          CustomeText(
                            title: 'تذكرني',
                            fontSize: 12.sp,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 15.h),
                  Obx(() {
                    return Container(
                      height:54.h,
                      margin: EdgeInsets.only(left: 20.w,right: 20.w),

                      child: RoundButtomLoading(
                          title: kSignIn.tr,
                          state: LoginControllerx.state.value,
                          press: () {
                            /*     Get.to(() => HomePageScreen(),
                                                        transition: Transition.rightToLeftWithFade);*/
                            if (LoginControllerx.state.value == 1) {
                              if (_fromKey!.currentState!.validate()) {
                                {
                                  LoginUser();
                                }
                              } else {
                                print("ffffff");
                              }
                            }
                          }),
                    );
                  }
                  ),
                  SizedBox(height: 10.h),
                  TextButton(
                      onPressed: () {
                        Get.to(() => HomePageScreen(typeGender: widget.typeGender,),
                            transition: Transition.rightToLeftWithFade);
                      },
                      child: CustomeText(
                        title: 'الدخول كزائر',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600,
                        decoration: TextDecoration.underline,
                      )),
                  TextButton(
                      onPressed: () {
                        Get.to(() => ViewForgetPass());

                      },
                      child: CustomeText(
                        title: 'نسيت كلمة المرور ؟ اضغط هنا',
                        fontSize: 18.sp,
                        // fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600,
                        decoration: TextDecoration.underline,
                      )),
                  SizedBox(height: 10.h),
                  GestureDetector(
                    onTap: (){
                      Get.to(() => ViewRegister(typeGender: widget.typeGender,));

                    },
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'ليس لديك حساب ؟ ',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 18.sp,
                          decoration: TextDecoration.underline,
                          // fontWeight: FontWeight.w500,
                          fontFamily: FONT_APP,
                        ),
                        children: [
                          TextSpan(
                            recognizer: _tapGestureRecognizer,
                            text: 'اضغط هنا',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 18,
                              fontFamily: FONT_APP,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void LoginUser() {
    var bodyData = {
      "mobile": _textEditingControllerPhoneNumber!.text,
      "password": _textEditingControllerPassword!.text,

    };
    print(bodyData);
    LoginControllerx.LoginUser(bodyData,_textEditingControllerPhoneNumber!.text,typeGender: widget.typeGender);

  }
}
