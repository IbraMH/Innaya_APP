import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/core/app_size.dart';
import 'package:innaya_app/widget/custom_textfilled_auth_app.dart';
import 'package:innaya_app/widget/custome_text.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late ImagePicker _imagePicker;
  XFile? _pickedFile;
  bool isLoading = false;
  bool onChange = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(SCREEN_WIDTH, SCREEN_HIGHT),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: BGroundStartPage,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo_home.png',
                    width: 90.w,
                    height: 90.h,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    children: [
                      CustomeText(
                        title: 'انشاء حساب جديد',
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700,
                      ),
                      SizedBox(height: 15.h),
                      GestureDetector(
                        onTap: () async {
                          await pickImage1();
                        },
                        child: SizedBox(
                          width: 70.w,
                          height: 60.h,
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 0.5.w,
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(10.r),
                              gradient: LinearGradient(colors: [
                                Color(0xffF4EAF3),
                                Color(0xffFEFEFE)
                              ], stops: [
                                0.0,
                                1.0
                              ], tileMode: TileMode.clamp),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 0), // changes position of shadow
                                ),
                              ],
                            ),
                            child: _pickedFile != null
                                ? Center(
                                    child: Image.file(
                                    File(_pickedFile!.path),
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                    isAntiAlias: true,
                                  ))
                                : Center(
                                    child: Image.asset(
                                    'assets/images/addImage.png',
                                    width: 45.w,
                                    height: 45.h,
                                  )),
                          ),
                        ),
                        // Center(child: Visibility(
                        //   visible: isLoading,
                        //   child: SizedBox(
                        //     height: 15.h,
                        //     width: 15.w,
                        //     child: CircularProgressIndicator(
                        //       color: Colors.grey,
                        //       strokeWidth: 3.w,
                        //     ),
                        //   ),
                        //   replacement: Container(),
                        // ),),
                      ),
                      SizedBox(height: 15.h),
                      CustomTextFilledAuthApp(
                        lable: 'اسم المستخدم',
                        suffixIcon: 'assets/images/user.png',
                        hintText: 'اسم المستخدم',
                        textInputType: TextInputType.name,
                      ),
                      SizedBox(height: 15.h),
                      CustomTextFilledAuthApp(
                        lable: 'البريد الالكتروني',
                        suffixIcon: 'assets/images/email.png',
                        hintText: 'البريد الالكتروني',
                        paddingIcon: 12,
                      ),
                      SizedBox(height: 15.h),
                      CustomTextFilledAuthApp(
                        lable: 'رقم الموبايل',
                        suffixIcon: 'assets/images/phone.png',
                        hintText: 'رقم الموبايل',
                        textInputType: TextInputType.phone,
                        paddingIcon: 10,
                      ),
                      SizedBox(height: 15.h),
                      CustomTextFilledAuthApp(
                        lable: 'كلمة المرور',
                        suffixIcon: 'assets/images/lock.png',
                        hintText: 'كلمة المرور',
                        textInputType: TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                      SizedBox(height: 15.h),
                      CustomTextFilledAuthApp(
                        lable: 'تاكيد كلمة المرور',
                        suffixIcon: 'assets/images/lock.png',
                        hintText: 'تاكيد كلمة المرور',
                        textInputType: TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                      SizedBox(height: 15.h),
                      CustomTextFilledAuthApp(
                        lable: 'اختر سؤال التحقق',
                        suffixIcon: 'assets/images/arrowDown2.png',
                        hintText: 'اختر سؤال التحقق',
                        readOnly: true,
                        pressCard: () {},
                      ),
                      SizedBox(height: 15.h),
                      CustomTextFilledAuthApp(
                        lable: 'اجابة سؤال التحقق',
                        suffixIcon: 'assets/images/answer.png',
                        hintText: 'اجابة سؤال التحقق',
                        textInputType: TextInputType.text,
                        paddingIcon: 12,
                      ),
                      SizedBox(height: 15.h),
                      Row(
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
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.bottomLeft,
                              child: CustomeText(
                                title:
                                    'اوافق على الشروط والاحكام الخاصة بالتطبيق واقر بأنني قرأتها و استوعبتها',
                                fontSize: 16.sp,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Container(
                        width: 180.w,
                        height: 50.h,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.w),
                          gradient: LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.centerLeft,
                            colors: [
                              Color(0xffF6E5EF),
                              Color(0xffE994BE),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 0), // changes position of shadow
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'assets/images/go.png',
                                width: 20.w,
                                height: 20.h,
                                color: titleStartPage,
                              ),
                              SizedBox(width: 10.w),
                              CustomeText(
                                title: 'تسجيل الدخول',
                                fontSize: 16.sp,
                                color: titleStartPage,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 25.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickImage1() async {
    _pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (_pickedFile == null) {
        print('false');
      }
    });
  }
}
