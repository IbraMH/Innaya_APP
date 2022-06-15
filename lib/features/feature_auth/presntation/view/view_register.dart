import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:innaya_app/core/PreferenceUtils.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/core/app_font.dart';
import 'package:innaya_app/core/app_images.dart';
import 'package:innaya_app/core/app_size.dart';
import 'package:innaya_app/core/const.dart';
import 'package:innaya_app/core/init_app.dart';
import 'package:innaya_app/features/feature_auth/controller/register_controller.dart';
import 'package:innaya_app/features/feature_auth/data/repositories/user_repositories.dart';
import 'package:innaya_app/features/feature_auth/presntation/view/view_edite_password.dart';
import 'package:innaya_app/features/feature_auth/presntation/widget/item_choos_cover.dart';
import 'package:innaya_app/features/feature_auth/presntation/widget/item_choos_image.dart';
import 'package:innaya_app/features/feature_auth/presntation/widget/item_select.dart';
import 'package:innaya_app/features/feature_auth/presntation/widget/item_select_data.dart';
import 'package:innaya_app/features/widget/RoundButtomLoading.dart';
import 'package:innaya_app/features/widget/card.dart';
import 'package:innaya_app/features/widget/custom_text_filled.dart';
import 'package:innaya_app/features/widget/custom_textfilled_auth_app.dart';
import 'package:innaya_app/features/widget/custom_textfilled_description.dart';
import 'package:innaya_app/features/widget/custom_textfilled_password.dart';
import 'package:innaya_app/features/widget/custom_textfilled_phone.dart';
import 'package:innaya_app/features/widget/custome_text.dart';
import 'package:innaya_app/features/widget/widjet_relase.dart';
import 'package:innaya_app/localization/lang/message.dart';
import 'package:innaya_app/utility/shared_method.dart';
import 'package:innaya_app/utility/size_config.dart';
import 'package:innaya_app/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class ViewRegister extends StatefulWidget {
  final bool isEditeProfile;
  final int typeGender;

  const ViewRegister({Key? key,this.isEditeProfile = false,this.typeGender=1}) : super(key: key);

  @override
  State<ViewRegister> createState() => _ViewRegisterState();
}

class _ViewRegisterState extends State<ViewRegister> {
  late ImagePicker _imagePicker;
  XFile? _pickedFile;
  bool isLoading = false;
  bool onChange = false;
  final ImagePicker _picker = ImagePicker();
  File? fileImage;
  String imageUrl="";

  XFile ?xfileProfile;
  TextEditingController? _textEditingControllerFullName;
  TextEditingController? _textEditingControllerMobile;
  TextEditingController? _textEditingControllerEmail;
  TextEditingController? _textEditingControllerPassword;
  TextEditingController? _textEditingControllerPasswordConfirmation;
  TextEditingController? _textEditingControllerAnswer;
  GlobalKey<FormState>? _fromKey;
  String password = "";
  String conform_password = "";
  dynamic _pickImageError;
  final RegisterControllerx = Get.put(RegisterController());

  @override
  void initState() {
    // TODO: implement initState
    _fromKey = GlobalKey<FormState>();
    _textEditingControllerFullName = TextEditingController();
    _textEditingControllerMobile = TextEditingController();
    _textEditingControllerPassword = TextEditingController();
    _textEditingControllerPasswordConfirmation = TextEditingController();
    _textEditingControllerAnswer = TextEditingController();
    _textEditingControllerEmail = TextEditingController();

    if (widget.isEditeProfile) {
      _textEditingControllerFullName!.text=PreferenceUtils.getUser()!.name!;
      _textEditingControllerEmail!.text=PreferenceUtils.getUser()!.email!;
      imageUrl=PreferenceUtils.getUser()!.image_url!;
    }
    _imagePicker = ImagePicker();

    super.initState();
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
                    (widget.typeGender==2)?LOGOSPLASH:"assets/images/logo_men.png",
                    width: 90.w,
                    height: 90.h,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child:  Form(
                    key: _fromKey,
                    child: Column(
                      children: [
                        CustomeText(
                          title: 'انشاء حساب جديد',
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700,
                        ),
                        SizedBox(height: 15.h),
                        ItemChooseImage(pressChooseImage: (){
                          _onImageButtonPressed();
                        },fileImage:fileImage ,imageUrl:imageUrl),
                      /*  GestureDetector(
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
                        ),*/
                        SizedBox(height: 12.h),
                        CustomTextFilledAuthApp(
                          lable: 'اسم المستخدم',
                          suffixIcon: 'assets/images/user.png',
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return kFiledNullError.tr;
                            } /*else if (!GetUtils.isEmail(value)) {
          return kInvalidEmailError.tr;
        }*/
                            return null;
                          },
                          hintText: 'اسم المستخدم',
                          controller: _textEditingControllerFullName,
                          textInputType: TextInputType.name,
                        ),
                        SizedBox(height: 12.h),
                        CustomTextFilledAuthApp(
                          lable: 'البريد الالكتروني',
                          controller: _textEditingControllerEmail,
                          suffixIcon: 'assets/images/email.png',
                          hintText: 'البريد الالكتروني',
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return kFiledNullError.tr;
                            } else if (!GetUtils.isEmail(value)) {
                              return kInvalidEmailError.tr;
                            }
                            return null;
                          },
                          paddingIcon: 12,
                        ),
                        SizedBox(height: 12.h),
                        CustomTextFilledAuthApp(
                          lable: 'رقم الموبايل',
                          controller: _textEditingControllerMobile,
                          validator: (value) {
                          if (value!.trim().isEmpty) {
                            return kFiledNullError.tr;
                          }else if (value.trim().length<9) {
                            return kValideMobileNumber.tr;
                          }
                          return null;
                        },
                          suffixIcon: 'assets/images/phone.png',
                          hintText: 'رقم الموبايل',
                          textInputType: TextInputType.phone,
                          paddingIcon: 10,
                        ),
                        SizedBox(height: 12.h),
                        (widget.isEditeProfile!)
                            ? SizedBox()
                            : Column(
                          children: [

                            CustomTextFilledAuthApp(
                              lable: 'كلمة المرور',
                              controller: _textEditingControllerPassword,
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return kFiledNullError.tr;
                                } /*else if (!GetUtils.isEmail(value)) {
          return kInvalidEmailError.tr;
        }*/
                                return null;
                              },
                              suffixIcon: 'assets/images/lock.png',
                              hintText: 'كلمة المرور',
                              textInputType: TextInputType.visiblePassword,
                              obscureText: true,
                            ),
                            SizedBox(height: 12.h),
                            CustomTextFilledAuthApp(
                              lable: 'تاكيد كلمة المرور',
                              controller: _textEditingControllerPasswordConfirmation,

                              suffixIcon: 'assets/images/lock.png',
                              hintText: 'تاكيد كلمة المرور',
                              textInputType: TextInputType.visiblePassword,
                              obscureText: true,
                            ),
                            /* ItemSelectData(
                                                  text: kChooseQuestion,
                                                  color: PostionApplayAnswer == -1
                                                      ? null
                                                      : Colors.black,
                                                  press: () {
                                                    showdiloge(3, kChooseQuestion.tr);
                                                  },
                                                ),
                                                (RegisterControllerx.quation.value ==
                                                        "")
                                                    ? SizedBox()
                                                    : Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 10.h,
                                                          ),
                                                          CustomeText(
                                                            textAlign:
                                                                TextAlign.start,
                                                            title: RegisterControllerx
                                                                .quation.value,
                                                            fontSize: fontSize15.sp,
                                                            color: Colors.black,
                                                          ),
                                                        ],
                                                      ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                BildeTextAnswer(),
                                                SizedBox(
                                                  height: 10.h,
                                                ),*/
                          ],
                        ),

                        widget.isEditeProfile?  _rowChangePass():SizedBox(),

                        SizedBox(height: 12.h),
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
                        SizedBox(height: 12.h),
                        Obx(() {
                          return SizedBox(
                            height: 54.h,
                            child: RoundButtomLoading(
                                title: (widget.isEditeProfile!)
                                    ? kEditProfile.tr
                                    : kSignUp.tr,
                                state: RegisterControllerx.state.value,
                                press: () {
                                  if (RegisterControllerx.state.value ==
                                      1) {
                                    if (_fromKey!.currentState!
                                        .validate()) {
                                      {
                                        /* if (!widget
                                                            .isEditeProfile &&
                                                            PostionSelectAnswer == -1) {
                                                          snackError(
                                                              title:
                                                              " ${kChooseQuestion.tr}",
                                                              body: kFiledNullError.tr);
                                                        }   else */if (!widget
                                          .isEditeProfile &&
                                          fileImage == null) {
                                        snackError(
                                            title:
                                            " ${kErorr.tr}",
                                            body: kChoosePhotoProfile.tr);
                                      } else {
                                        if (widget.isEditeProfile) {
                                          updateDataUser();
                                        } else {
                                          // showfullAds();
                                          addDataRegiser();

                                        }
                                      }
                                      }
                                    } else {
                                      print("ffffff");
                                    }
                                  }
                                }),
                          );
                        }),
                        SizedBox(height: 25.h),
                      ],
                    ),
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
      }else{
        fileImage = File(xfileProfile!.path);

      }
    });
  }
  void _onImageButtonPressed() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        if (pickedFile != null) {
          xfileProfile = pickedFile;
          imageUrl = "";
          fileImage = File(xfileProfile!.path);
        }
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
        print(_pickImageError);
      });
    }
  }


    addDataRegiser() {
      Map<String, Object> mapRegiaster = {
        kFullName: _textEditingControllerFullName!.text,
        kMobileNumber: _textEditingControllerMobile!.text,
        kEmail: _textEditingControllerEmail!.text,
        kPassword: _textEditingControllerPassword!.text,
        kConfirmPassword: _textEditingControllerPasswordConfirmation!.text,
        kGender:widget.typeGender,
        kCoverPhoto: fileImage!,
        kAgree_Term: "0",
      };
/*    kAnswe: _textEditingControllerAnswer!.text,
    kChooseQuestion:
    "${ getIt<GetQuestion>().listQuestion![PostionApplayAnswer]!.id}",*/
      RegisterControllerx.registerAndUpdateUser(mapRegiaster,1);
    }

    updateDataUser() {
      File file;
      if(fileImage==null){
        file=File("2");
      }else{
        file= fileImage!;
      }
      Map<String, Object> mapRegiaster = {
        kFullName: _textEditingControllerFullName!.text,
        kEmail: _textEditingControllerEmail!.text,
        kCoverPhoto: file,
        kAgree_Term: "0",
      };
      RegisterControllerx.registerAndUpdateUser(mapRegiaster,2);
    }

  Widget _rowChangePass(){
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: (){
                Get.to(() => EditePasswordUser(isFoget: false,),
                    transition: Transition.rightToLeftWithFade);
              },
              child: CustomeText(
                title: kEditPassword,
                color: kColorPrimary,
                fontSize: fontSize13,
                fontFamily: FONT_APP,
              ),
            ),
            CustomeText(
              title: "",
              color: kColorPrimary,
              fontSize: fontSize13,
              fontFamily: FONT_APP,
            ),
          ],
        ),
      ],
    );
  }
}