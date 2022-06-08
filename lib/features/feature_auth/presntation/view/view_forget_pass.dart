import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/core/app_font.dart';
import 'package:innaya_app/core/app_images.dart';
import 'package:innaya_app/core/app_size.dart';
import 'package:innaya_app/core/init_app.dart';
import 'package:innaya_app/features/feature_auth/controller/login_controller.dart';
import 'package:innaya_app/features/feature_auth/controller/register_controller.dart';
import 'package:innaya_app/features/feature_auth/data/repositories/user_repositories.dart';
import 'package:innaya_app/features/feature_auth/presntation/view/view_register.dart';
import 'package:innaya_app/features/feature_auth/presntation/widget/item_select.dart';
import 'package:innaya_app/features/feature_auth/presntation/widget/item_select_data.dart';
import 'package:innaya_app/features/widget/RoundButtomLoading.dart';
import 'package:innaya_app/features/widget/custom_text_filled.dart';
import 'package:innaya_app/features/widget/custom_textfilled_password.dart';
import 'package:innaya_app/features/widget/custom_textfilled_phone.dart';
import 'package:innaya_app/features/widget/custome_text.dart';
import 'package:innaya_app/features/widget/widjet_relase.dart';
import 'package:innaya_app/localization/lang/message.dart';
import 'package:innaya_app/utility/shared_method.dart';
import 'package:innaya_app/utility/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
class ViewForgetPass extends StatefulWidget {
  const ViewForgetPass({Key? key}) : super(key: key);

  @override
  _ViewForgetPassState createState() => _ViewForgetPassState();
}

class _ViewForgetPassState extends State<ViewForgetPass> {
  TextEditingController ?_textEditingControllerAnswer;
  TextEditingController ?_textEditingControllerPhone;

  GlobalKey<FormState>? _fromKey;

  final LoginControllerx=Get.put(LoginController());

  int PostionSelectAnswer = -1;
  int PostionApplayAnswer = -1;
  @override
  void initState() {
    _fromKey = GlobalKey<FormState>();
    _textEditingControllerAnswer = TextEditingController();
    _textEditingControllerPhone = TextEditingController();

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _textEditingControllerAnswer!.dispose();
    _textEditingControllerPhone!.dispose();
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
      appBar: getIt<WidjetRelase>().appBar(title: kForgot_Password),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 40,right: 40),

        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('assets/icons/backround_splah.png'),
            fit: BoxFit.contain,
            //  alignment:Alignment.topCenter,
          ),
        ),
        child:  Column(
          mainAxisAlignment:MainAxisAlignment.start ,
          crossAxisAlignment:CrossAxisAlignment.center ,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisAlignment:MainAxisAlignment.start ,
                    crossAxisAlignment:CrossAxisAlignment.center ,
                    children: [
                      SizedBox(
                        height:50.h,
                      ),
                      Container(
                        margin:EdgeInsets.only(top: 20) ,
                        alignment: Alignment.center,
                        child:SvgPicture.asset(
                          "assets/icons/rest_passwoed.svg",
                          height: SizeConfig.screenHeight! * 0.1,
                        ),
                      ),
                      SizedBox(
                        height:40.h,
                      ),


                      Form(
                          key: _fromKey,
                          child: Column(
                            children: [

                              BildeTextPhoneNumber(),
                              SizedBox(
                                height: 10.h,
                              ),
                              /*ItemSelectData(
                                text: kChooseQuestion,
                                color: PostionApplayAnswer==-1?null:Colors.black,

                                press: (){
                                  showdiloge(3,kChooseQuestion.tr);
                                },
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              CustomeText(
                                textAlign: TextAlign.start,
                                title: RegisterControllerx.quation.value,
                                fontSize: fontSize15.sp,
                                color: Colors.black,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),

                              BildeTextAnswer(),*/
                              SizedBox(
                                height: 30.h),

                              Obx(() {
                                return SizedBox(
                                  height:54.h,

                                  child: RoundButtomLoading(
                                      title: kApply.tr,
                                      state: LoginControllerx.state.value,
                                      press: () {
                                        if (LoginControllerx.state.value == 1) {
                                          if (_fromKey!.currentState!.validate()) {
                                            {
                                              checkForgetPass();
                                            }
                                          } else {
                                            print("ffffff");
                                          }
                                        }
                                      }),
                                );
                              }
                              ),
                            ],
                          )),

                      SizedBox(
                        height: getProportionateScreenWidth(30),
                      ),
                      // FooterLogin(),
                    ],
                  ),
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
    );
  }
  Widget BildeTextPhoneNumber() {
    return CustomTextFilledPhone(
      lable: kMobileNumber,

      //    iconsvg: "assets/icons/Mail.svg",
      hintText: kMobileNumber,
      controller: _textEditingControllerPhone,
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
        if (value!.isEmpty) {
          return kFiledNullError.tr;
        } /*else if (!GetUtils.isEmail(value)) {
          return kInvalidEmailError.tr;
        }*/
        return null;
      },
    );
  }

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
                          child:ListQuisation(mystate)),
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
                                  PostionApplayAnswer=PostionSelectAnswer;
                                  if(PostionApplayAnswer!=-1){
                                   // RegisterControllerx.quation.value=getIt<UserRepositories>().listQuestions![PostionApplayAnswer]!.text!;
                                  }
                                  Get.back();
                                  setState(() {

                                  });
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


  void checkForgetPass() {
    var bodyData = {
/*      "question_id": "${ getIt<UserRepositories>().listQuestions![PostionApplayAnswer]!.id}",
      "answer": _textEditingControllerAnswer!.text,*/
      "mobile": _textEditingControllerPhone!.text,

    };
    print(bodyData);
    LoginControllerx.sendSmsForget(bodyData,_textEditingControllerPhone!.text);

  }
  showdiloge(int type, String title) {
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
  Widget ListQuisation(StateSetter mystate) {
    return SizedBox(
      // height: SizeConfig.screenHeight! * 0.50,
      child: ListView.builder(
        padding: EdgeInsets.all(0),
        shrinkWrap: true,
        itemBuilder: (context, postion) {
          return ItemSelect(
            showImage: false,
            text: getIt<UserRepositories>().listQuestions![postion]!.text,
            press: () {
              mystate(() {
                PostionSelectAnswer = postion;
              });
              //  Get.back();
            },
            select: (PostionSelectAnswer == postion) ? true : false,
          );
        },
        itemCount: getIt<UserRepositories>().listQuestions!.length,
      ),
    );
  }
}
