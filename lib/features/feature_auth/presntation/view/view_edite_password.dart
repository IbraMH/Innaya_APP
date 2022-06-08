import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/core/app_size.dart';
import 'package:innaya_app/core/init_app.dart';
import 'package:innaya_app/features/feature_auth/controller/login_controller.dart';
import 'package:innaya_app/features/feature_auth/controller/register_controller.dart';
import 'package:innaya_app/features/widget/RoundButtomLoading.dart';
import 'package:innaya_app/features/widget/custom_textfilled_password.dart';
import 'package:innaya_app/features/widget/widjet_relase.dart';
import 'package:innaya_app/localization/lang/message.dart';
import 'package:innaya_app/utility/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class EditePasswordUser extends StatefulWidget {
  bool isFoget;

  EditePasswordUser({this.isFoget=false});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<EditePasswordUser> {

  var _fromKey;
  int state = 1;
  TextEditingController ?_textEditingControllerPassword;
  TextEditingController? _textEditingControllerPasswordConfirmation;
  TextEditingController? _textEditingControllerOldePassword;
  final login_Controller=Get.put(LoginController());

  String password = "", p1 = "", p2 = "", p3 = "";
  String ?conform_password;

  @override
  void initState() {
    _textEditingControllerPasswordConfirmation = TextEditingController();
    _textEditingControllerPassword = TextEditingController();
    _textEditingControllerOldePassword = TextEditingController();
    _fromKey = GlobalKey<FormState>();
    ;

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _textEditingControllerPasswordConfirmation!.dispose();
    _textEditingControllerPassword!.dispose();
    _textEditingControllerOldePassword!.dispose();

    // TODO: implement dispose
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
      appBar: getIt<WidjetRelase>().appBar(title: ''),
      body: Container(
        margin: EdgeInsets.all(20),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Form(
            key: _fromKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    "assets/icons/edite_password.svg",
                    height: SizeConfig.screenHeight! * 0.1,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  kChangeYourPassword.tr,
                  style: TextStyle(
                      color: kBorderFocuseColor,
                      fontSize: getProportionateScreenWidth(15),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  kNotNewRestPassword.tr,
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(12),
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),


                SizedBox(
                  height: 50,
                ),
                (widget.isFoget)?SizedBox(): Column(
                  children: [
                    BuildOldePassword(),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
                BildeTextPassword(),
                SizedBox(
                  height: 20,
                ),
                BuildRePassword(),
                SizedBox(
                  height: 50,
                ),
                Obx(() {
                  return SizedBox(
                    height:54.h,

                    child: RoundButtomLoading(
                        title: kApply.tr,
                        state: login_Controller.state.value,
                        press: () {
                          if (login_Controller.state.value == 1) {
                            if (_fromKey!.currentState!.validate()) {
                              {
                                EditePassword();
                              }
                            } else {
                              print("ffffff");
                            }
                          }
                        }),
                  );
                }
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget BuildOldePassword() {
    return CustomTextFilledPassword(
        lable: kOldPassword,
        // iconsvg: "assets/icons/Lock.svg",
        hintText: kOldPassword,
        controller: _textEditingControllerOldePassword,
        onChanged: (value) {
          p1 = value;
          password = value;
          setState(() {});
        },
        validator: (value) {
          if (value!.length == 0) {
            //   addError(error: kPassNullError);
            return kFiledNullError.tr;
          }
          return null;
        });
  }
/*  Widget BuildOldePassword() {
    return CustomTextFilledPassword(
        lable: kOldPassword,
        // iconsvg: "assets/icons/Lock.svg",
        isNotEmpty: p1.length >= 1 ? true : false,
        hintText: kOldPassword,
        controller: _textEditingControllerOldePassword,
        onChanged: (value) {
          p1 = value;
          password = value;
          setState(() {});
        },
        validator: (value) {
          if (value.isEmpty) {
            return kPassNullError.tr;
          } else if (value.length < 6) {
            return kShortPassError.tr;
          }
          return null;
        });
  }

  Widget BuildPassword() {
    return CustomTextFilledPassword(
        lable: kNewPassword,
        // iconsvg: "assets/icons/Lock.svg",
        isNotEmpty: p2.length >= 1 ? true : false,
        hintText: kPassword,
        controller: _textEditingControllerPassword,
        onChanged: (value) {
          p2 = value;
          password = value;
          setState(() {});
        },
        validator: (value) {
          if (value.isEmpty) {
            return kPassNullError.tr;
          } else if (value.length < 6) {
            return kShortPassError.tr;
          }
          return null;
        });
  }*/
  Widget BildeTextPassword() {
    return CustomTextFilledPassword(
        lable: kNewPassword,
        iconsvg: "assets/icons/Lock.svg",
        hintText: kNewPassword,
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
          if (value!.length == 0) {
            //   addError(error: kPassNullError);
            return kFiledNullError.tr;
          }
          else if (value.length < 6) {
            //addError(error: kShortPassError);
            return kShortPassError.tr;
          }
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
        if (value!.isEmpty) {
          return kFiledNullError.tr;
        } else if ((password != value)) {
          return kMatchPassError.tr;
        }
        return null;
      },
    );
  }
  void EditePassword()async {
    var bodyData;
    if(widget.isFoget){
      bodyData = {
        "password": _textEditingControllerPassword!.text,
        "password_confirmation": _textEditingControllerPasswordConfirmation!.text,

      };
      login_Controller.changePass(bodyData,1);

    }else{
      bodyData = {
        "current_password": _textEditingControllerOldePassword!.text,
        "password": _textEditingControllerPassword!.text,
        "password_confirmation": _textEditingControllerPasswordConfirmation!.text,
      };
      login_Controller.changePass(bodyData,2);


    }

    print(bodyData);
    //WidjetRelase.getIntanse().onLoading(mcontext).show();

  }


}
