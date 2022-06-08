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
  const ViewRegister({Key? key, this.isEditeProfile = false}) : super(key: key);

  @override
  _ViewRegisterState createState() => _ViewRegisterState();
}

class _ViewRegisterState extends State<ViewRegister> {
  TextEditingController? _textEditingControllerFullName;
  TextEditingController? _textEditingControllerMobile;
  TextEditingController? _textEditingControllerEmail;
  TextEditingController? _textEditingControllerPassword;
  TextEditingController? _textEditingControllerPasswordConfirmation;
  TextEditingController? _textEditingControllerAnswer;
  GlobalKey<FormState>? _fromKey;
  String password = "";
  String conform_password = "";
  final RegisterControllerx = Get.put(RegisterController());
  int cityIdSelect = -1;
  int RegionIdSelect = -1;
  int questionIdSelect = -1;
  double numberSpace = 15.0;
  int PostionSelectCity = -1;
  int PostionApplayCity = -1;
  int PostionSelectState = -1;
  int PostionApplayState = -1;
  int PostionSelectAnswer = -1;
  int PostionApplayAnswer = -1;
  String imageUrl="";
  bool checkedValue = false;
  dynamic _pickImageError;
  ScrollController scrollController = ScrollController();
  var _scrollController = ScrollController();
  set _imageFile(XFile? value) {
    _imageFileList = value == null ? null : [value];
  }
  List<XFile>? _imageFileList;
  final ImagePicker _picker = ImagePicker();
   File? fileImage;
  XFile ?xfileProfile;
  @override
  void initState() {
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
    scrollController.addListener(() {
//      hideFocus(context);
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _textEditingControllerFullName!.dispose();
    _textEditingControllerMobile!.dispose();
    _textEditingControllerPassword!.dispose();
    _textEditingControllerPasswordConfirmation!.dispose();
    _textEditingControllerAnswer!.dispose();
    _textEditingControllerEmail!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
     context
          
          ,
      designSize: Size(SCREEN_WIDTH, SCREEN_HIGHT),
    );
    return Scaffold(
      appBar: getIt<WidjetRelase>()
          .appBar(title: (widget.isEditeProfile!) ? kEditProfile : kSignUp),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 10.w,right: 10.w,top: 20.h,bottom: 30.h),
          height: MediaQuery.of(context).size.height,
         /* decoration: const BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage(splashbk),
              fit: BoxFit.cover,
              //  alignment:Alignment.topCenter,
            ),
          ),*/
          child: ReusableCard( child:SizedBox(
            height: MediaQuery.of(context).size.height*0.9,

            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Container(
                        alignment: Alignment.topCenter,
                        child:  Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: getProportionateScreenWidth(40),
                              ),
                             ItemChooseImage(pressChooseImage: (){
                               _onImageButtonPressed();
                             },fileImage:fileImage ,imageUrl:imageUrl),
                              Form(
                                  key: _fromKey,
                                  child: Column(
                                    children: [
                                      /*     CustomeText(
                                          fontSize: 25.sp,
                                          color: Colors.black,
                                          title:(widget.isEditeProfile!)?kEditProfile: kSignUp,
                                          press: () {},
                                        ),*/
                                      SizedBox(
                                        height: numberSpace.h,
                                      ),
                                      BildeTextFullName(),

                                      (widget.isEditeProfile!)
                                          ? SizedBox()
                                          : Column(
                                        children: [
                                          SizedBox(
                                            height: numberSpace.h,
                                          ),
                                          BildeTextMobileNumber()
                                        ],
                                      ),

                                      SizedBox(
                                        height: numberSpace.h,
                                      ),
                                      filedEmail(),



                                      SizedBox(
                                        height: numberSpace.h,
                                      ),

                                      (widget.isEditeProfile!)
                                          ? SizedBox()
                                          : Column(
                                              children: [

                                                BildeTextPassword(),
                                                SizedBox(
                                                  height: numberSpace.h,
                                                ),
                                                BuildRePassword(),
                                                SizedBox(
                                                  height: numberSpace.h,
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
                                      SizedBox(
                                        height: 30.h,
                                      ),
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
                                    ],
                                  )),
                              SizedBox(
                                height: getProportionateScreenWidth(25),
                              ),
                            ],
                          )

                      ),
                    ),
                  ),
                  /* Padding(
                        padding: const EdgeInsets.all(20),
                        child: FooterLogin(),
                      ),*/

                  //  (isLoading)  WidjetRelase.getIntanse().onLoading(context):SizedBox(),
                ],
              ),
          ),
          ),
        ),
      ),
    );
  }
  void _onImageButtonPressed() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        if (pickedFile != null) {
          xfileProfile = pickedFile;
          imageUrl="";
          fileImage=File(xfileProfile!.path);
        }
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
        print(_pickImageError);
      });
    }
  }

  Widget BildeTextFullName() {
    return CustomTextFilled(
      lable: kFullName,
      //    iconsvg: "assets/icons/Mail.svg",
      hintText: kFullName,
      controller: _textEditingControllerFullName,
      onChanged: (value) {
        return null;
      },
      validator: (value) {
        if (value!.trim().isEmpty) {
          return kFiledNullError.tr;
        } /*else if (!GetUtils.isEmail(value)) {
          return kInvalidEmailError.tr;
        }*/
        return null;
      },
    );
  }


  Widget BildeTextAnswer() {
    return CustomTextFilled(
      lable: kAnswe,
      //    iconsvg: "assets/icons/Mail.svg",
      hintText: kAnswe,
      controller: _textEditingControllerAnswer,
      onChanged: (value) {
        return null;
      },
      validator: (value) {
        if (value!.trim().isEmpty) {
          return kFiledNullError.tr;
        } /*else if (!GetUtils.isEmail(value)) {
          return kInvalidEmailError.tr;
        }*/
        return null;
      },
    );
  }


  Widget BildeTextMobileNumber() {
    return CustomTextFilledPhone(
      lable: kMobileNumber,

      //    iconsvg: "assets/icons/Mail.svg",
      hintText: kMobileNumber,
      controller: _textEditingControllerMobile,
      onChanged: (value) {
        return null;
      },
      validator: (value) {
        if (value!.trim().isEmpty) {
          return kFiledNullError.tr;
        }else if (value.trim().length<9) {
          return kValideMobileNumber.tr;
        }
        return null;
      },
    );
  }


  Widget filedEmail(){
    return  CustomTextFilled(
      textInputType: TextInputType.emailAddress,

      lable: kEmail,
      //    iconsvg: "assets/icons/Mail.svg",
      hintText: kEmail,
      controller: _textEditingControllerEmail,

      validator: (value) {
        if (value!.trim().isEmpty) {
          return kFiledNullError.tr;
        } else if (!GetUtils.isEmail(value)) {
          return kInvalidEmailError.tr;
        }
        return null;
      },
    );

  }

  Widget BildeTextPassword() {
    return CustomTextFilledPassword(
        lable: kPassword,
        iconsvg: "assets/icons/Lock.svg",
        hintText: kPassword,
        type: 1,
        isNotEmpty: password.length >= 1 ? true : false,
        controller: _textEditingControllerPassword,
        onChanged: (value) {
          password = value;
          setState(() {});
          return null;
          //password = value;
        },
        validator: (value) {
          if (value!.trim().length == 0) {
            //   addError(error: kPassNullError);
            return kFiledNullError.tr;
          }
          /*else if (value.length < 8) {
            //addError(error: kShortPassError);
            return kShortPassError.tr;
          }*/
          return null;
        });
  }

  Widget BuildRePassword() {
    return CustomTextFilledPassword(
      lable: kConfirmPassword,
      type: 1,
      // iconsvg: "assets/icons/Lock.svg",

      hintText: kConfirmPassword,
      controller: _textEditingControllerPasswordConfirmation,
      onChanged: (value) {
        conform_password = value;
      },
      validator: (value) {
        if (value!.trim().isEmpty) {
          return kFiledNullError.tr;
        } else if ((password != value)) {
          return kMatchPassError.tr;
        }
        return null;
      },
    );
  }

/*  Widget ListCity(StateSetter mystate) {
    return SizedBox(
      // height: SizeConfig.screenHeight! * 0.50,
      child: ListView.builder(
        padding: EdgeInsets.all(0),
        shrinkWrap: true,
        itemBuilder: (context, postion) {
          return ItemSelect(
            showImage: false,
            text: getIt<CategoryRepositories>()
                .listCitiesfinal[PostionApplayState]
                .listRegion![postion]!
                .name,
            press: () {
              mystate(() {
                PostionSelectCity = postion;
              });
              //  Get.back();
            },
            select: (PostionSelectCity == postion) ? true : false,
          );
        },
        itemCount: getIt<CategoryRepositories>()
            .listCitiesfinal[PostionApplayState]
            .listRegion!
            .length,
      ),
    );
  }*/

  /*Widget ListQuisation(StateSetter mystate) {
    return SizedBox(
      // height: SizeConfig.screenHeight! * 0.50,
      child: ListView.builder(
        padding: EdgeInsets.all(0),
        shrinkWrap: true,
        itemBuilder: (context, postion) {
          return ItemSelect(
            showImage: false,
            text: getIt<GetQuestion>().listQuestion![postion]!.text,
            press: () {
              mystate(() {
                PostionSelectAnswer = postion;
              });
              //  Get.back();
            },
            select: (PostionSelectAnswer == postion) ? true : false,
          );
        },
        itemCount: getIt<GetQuestion>().listQuestion!.length,
      ),
    );
  }*/
/*
  Widget ListState(StateSetter mystate) {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      shrinkWrap: true,
      itemBuilder: (context, postion) {
        return ItemSelect(
          showImage: false,
          text: getIt<CategoryRepositories>().listCitiesfinal[postion].name,
          press: () {
            mystate(() {
              PostionSelectState = postion;
            });
            //  Get.back();
          },
          select: (PostionSelectState == postion) ? true : false,
        );
      },
      itemCount: getIt<CategoryRepositories>().listCitiesfinal.length,
    );
  }*/
/*
  Widget ShowdilogeFiltter(int type, String title) {
    return Material(
      child: Container(
        color: Colors.transparent,
        margin: EdgeInsets.all(20),
        child: StatefulBuilder(
            builder: (BuildContext context, StateSetter mystate) {
          return Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            //height:(type == 8 && _myKitchenController.myKitchen.value.menus.length <5)?SizeConfig.screenHeight * 0.40:(type == 5 && ListServingType.length <7)?SizeConfig.screenHeight * 0.52: SizeConfig.screenHeight * 0.6,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      CustomeText(
                        title: title,
                        color: Colors.black,
                        fontSize: fontSize16,
                        fontFamily: FONT_APP,
                      ),
                    ],
                  ),
                  Flexible(
                      child: */
/*(type == 1)
                          ? ListState(mystate)
                          : (type == 2)
                              ? ListCity(mystate)
                              :*//*
 ListQuisation(mystate)),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: SizedBox(
                        height: getProportionateScreenWidth(40),
                        child: RoundButtomLoading(
                            title: kApply.tr,
                            press: () {
                              if (type == 1) {
                                PostionApplayState = PostionSelectState;
                                if (PostionApplayState != -1) {
                        */
/*          RegisterControllerx!.StateName.value =
                                      getIt<CategoryRepositories>()
                                          .listCitiesfinal[PostionApplayState]
                                          .name!;*//*

                                  setState(() {});
                                  Get.back();
                                }
                              } else if (type == 2) {
                                PostionApplayCity = PostionSelectCity;
                                if (PostionApplayCity != -1) {
                               */
/*   RegisterControllerx!.cityName.value =
                                      getIt<CategoryRepositories>()
                                          .listCitiesfinal[PostionApplayState]
                                          .listRegion![PostionApplayCity]
                                          .name!;*//*

                                  setState(() {});
                                  Get.back();
                                }
                              } else {
                                PostionApplayAnswer = PostionSelectAnswer;
                                if (PostionApplayAnswer != -1) {
                                  RegisterControllerx.quation.value =
                                  getIt<GetQuestion>().listQuestion![PostionApplayAnswer]!
                                          .text!;
                                }
                                Get.back();
                              }
                              hideFocus(context);
                            },
                            state: 1,
                            colore: kColorButtom)),
                  )
                ]),
          );
        }),
      ),
    );
  }
*/

 /* showdiloge(int type, String title) {
    showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
            alignment: Alignment.bottomCenter,
            child: ShowdilogeFiltter(type, title));
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position:
              Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
    );
  }
*/
  addDataRegiser() {
    Map<String, Object> mapRegiaster = {
      kFullName: _textEditingControllerFullName!.text,
      kMobileNumber: _textEditingControllerMobile!.text,
      kEmail: _textEditingControllerEmail!.text,
      kPassword: _textEditingControllerPassword!.text,
      kConfirmPassword: _textEditingControllerPasswordConfirmation!.text,

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


  void showfullAds() {
    RegisterControllerx.buttomIsActive.value = false;
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black12.withOpacity(0.6),
      // Background color
      barrierDismissible: true,
      barrierLabel: 'Dialog',
      transitionDuration: Duration(milliseconds: 400),
      // How long it takes to popup dialog after button click
      pageBuilder: (_, __, ___) {
        // Makes widget fullscreen
        return Material(
          child: StatefulBuilder(
              builder: (BuildContext context, StateSetter mystate) {
            _scrollController.addListener(() {
              final bool isEnd = _scrollController.offset >=
                  _scrollController.position.maxScrollExtent;
              if (isEnd) {
                print("end cccvdvvsvdsvsd scroll");
                RegisterControllerx.buttomIsActive.value = true;
              }
            });
            return Obx(() {
              return SafeArea(
                  child: Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20.h,
                      ),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                //padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                 //   boxShadow: showShadowRate(),
                                    /*    borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30.w),
                                          bottomLeft: Radius.circular(30.w),
                                        ),*/
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: Icon(Icons.close,color: Colors.red,),
                              )),
                          CustomeText(
                            title: kTermsOfUse,
                            color: Colors.black,
                            fontSize: fontSize16,
                            fontFamily: FONT_APP,
                          ),
                          SizedBox()
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          child: CustomeText(
                            title:"",
                             //   "${Utility.getText(keyPrivacy_policy_merchants)}",
                            color: Colors.black,
                            fontSize: fontSize16,
                            fontFamily: FONT_APP,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CheckboxListTile(
                        title: GestureDetector(
                          child: CustomeText(
                            textAlign: TextAlign.start,
                            title: kAgree_Term,
                            fontSize: fontSize13.sp,
                            color: (RegisterControllerx.buttomIsActive.value)
                                ? kColorButtom
                                : kBorderColor,
                          ),
                          onTap: () {
                            if (RegisterControllerx.buttomIsActive.value) {
                              mystate(() {
                                checkedValue = !checkedValue;
                                print(checkedValue);
                              });
                            }
                          },
                        ),
                        value: checkedValue,
                        onChanged: (newValue) {
                          if (RegisterControllerx.buttomIsActive.value) {
                            mystate(() {
                              checkedValue = newValue!;
                              print(checkedValue);
                            });
                          }
                        },
                        controlAffinity: ListTileControlAffinity
                            .leading, //  <-- leading Checkbox
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: SizedBox(
                            height: getProportionateScreenWidth(40),
                            child: RoundButtomLoading(
                                title: kApply.tr,
                                press: () {
                                  if (RegisterControllerx
                                      .buttomIsActive.value) {
                                    if (checkedValue == false) {
                                      snackError(
                                          title: "${kErorr.tr}",
                                          body: kAgree_Term.tr);
                                    } else {
                                      Get.back();
                                      if (RegisterControllerx.state.value ==
                                          1) {
                                       addDataRegiser();
                                      }
                                    }
                                  }
                                },
                                state: 1,
                                colore:
                                (RegisterControllerx.buttomIsActive.value)
                                    ? kColorButtom
                                    : kBorderColor)),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
                  ));
            });
              }),
        );
      },
    );
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
