import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/core/app_font.dart';
import 'package:innaya_app/features/feature_auth/presntation/view/register.dart';
import 'package:innaya_app/features/feature_home/presntation/view/home_screen.dart';
import 'package:innaya_app/widget/custom_textfilled_auth_app.dart';
import 'package:innaya_app/widget/custome_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController? userNameController;
  TextEditingController? passwordController;
  TapGestureRecognizer? _tapGestureRecognizer;
  bool onChange = false;

  @override
  void initState() {
    // TODO: implement initState
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    setState(() {
      _tapGestureRecognizer = TapGestureRecognizer()..onTap = goToSignUp;
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    userNameController!.dispose();
    passwordController!.dispose();
    super.dispose();
  }

  void goToSignUp() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RegisterScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BGroundStartPage,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50.h),
              Image.asset(
                'assets/images/title.png',
                width: 120.w,
                height: 40.h,
              ),
              SizedBox(height: 50.h),
              Image.asset(
                'assets/images/logo.png',
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
                widthTextField: 250,
                lable: 'اسم المستخدم',
                suffixIcon: 'assets/images/user.png',
                hintText: 'اسم المستخدم',
                textInputType: TextInputType.name,
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 65.w),
                  SizedBox(
                    width: 250.w,
                    child: CustomTextFilledAuthApp(
                      widthTextField: 250,
                      lable: 'كلمة المرور',
                      suffixIcon: 'assets/images/lock.png',
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
                            value: false,
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

              SizedBox(height: 30.h),
              Container(
                width: 180.w,
                height: 50.h,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.w),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xffE994BE),
                      Color(0xffF6E5EF),
                      Color(0xffF6E5EF),
                      Color(0xffE994BE),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: ElevatedButton(
                  clipBehavior: Clip.antiAlias,
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Colors.transparent,
                      minimumSize: Size(180.w, 50.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.w),
                      )),
                  onPressed: () {},
                  child: CustomeText(
                    title: 'دخول',
                    fontSize: 24.sp,
                    color: titleStartPage,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              TextButton(
                  onPressed: () {},
                  child: CustomeText(
                    title: 'الدخول كزائر',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600,
                    decoration: TextDecoration.underline,
                  )),
              // SizedBox(height: 10.h),
              TextButton(
                  onPressed: () {},
                  child: CustomeText(
                    title: 'نسيت كلمة المرور ؟ اضغط هنا',
                    fontSize: 18.sp,
                    // fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600,
                    decoration: TextDecoration.underline,
                  )),
              SizedBox(height: 10.h),
              RichText(
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
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }
}
