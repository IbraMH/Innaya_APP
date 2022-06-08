import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/core/app_images.dart';
import 'package:innaya_app/core/app_size.dart';
import 'package:innaya_app/core/init_app.dart';
import 'package:innaya_app/features/feature_auth/controller/login_controller.dart';
import 'package:innaya_app/features/feature_auth/presntation/view/view_forget_pass.dart';
import 'package:innaya_app/features/feature_auth/presntation/view/view_register.dart';
import 'package:innaya_app/features/feature_auth/presntation/widget/row_icon_login.dart';
import 'package:innaya_app/features/feature_home/presntation/view/home_screen.dart';
import 'package:innaya_app/features/widget/RoundButtomLoading.dart';
import 'package:innaya_app/features/widget/card.dart';
import 'package:innaya_app/features/widget/custom_textfilled_password.dart';
import 'package:innaya_app/features/widget/custom_textfilled_phone.dart';
import 'package:innaya_app/features/widget/custome_text.dart';
import 'package:innaya_app/features/widget/widjet_relase.dart';
import 'package:innaya_app/localization/lang/message.dart';
import 'package:innaya_app/utility/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:innaya_app/utility/utility.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
class ViewLogin extends StatefulWidget {
  final int typeGender;
  const ViewLogin({Key? key,this.typeGender=1}) : super(key: key);

  @override
  _ViewLoginState createState() => _ViewLoginState();
}

class _ViewLoginState extends State<ViewLogin> {
  TextEditingController ?_textEditingControllerPhoneNumber;
  TextEditingController? _textEditingControllerPassword;

  GlobalKey<FormState>? _fromKey;

  final LoginControllerx=Get.put(LoginController());
  String password="";

  @override
  void initState() {
    _fromKey = GlobalKey<FormState>();
    _textEditingControllerPhoneNumber = TextEditingController();
    _textEditingControllerPassword = TextEditingController();

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _textEditingControllerPhoneNumber!.dispose();
    _textEditingControllerPassword!.dispose();
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
      appBar: getIt<WidjetRelase>().appBar(title: kSignIn),
      body:SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 15.w,right: 15.w,top: 40.h,bottom: 130.h),

          height: MediaQuery.of(context).size.height,
          /*decoration: const BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage(splashbk),
              fit: BoxFit.cover,
              //  alignment:Alignment.topCenter,
            ),
          ),*/
          child:ReusableCard(child:Container(
                  height: MediaQuery.of(context).size.height*0.8,

                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment:MainAxisAlignment.start ,
                    crossAxisAlignment:CrossAxisAlignment.center ,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          physics: AlwaysScrollableScrollPhysics(),

                          child: Column(
                            mainAxisSize: MainAxisSize.min,

                            mainAxisAlignment:MainAxisAlignment.start ,
                            crossAxisAlignment:CrossAxisAlignment.center ,
                            children: [
                              SizedBox(
                                height:10.h,
                              ),

                              Image.asset(
                                (widget.typeGender==2)?LOGOSPLASH:"assets/images/logo_men.png",
                                height: SizeConfig.screenHeight! * 0.15,
                              ),

                        /*      CustomeText(
                                fontSize: fontSize15.sp,
                                title: kSignIn,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),*/
                      /*        SizedBox(
                                height:20.h,
                              ),
                              RowIconLogin(loginController: LoginControllerx),*/
                              SizedBox(
                                height:20.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      color: kColorButtom,
                                      height: 1,
                                      width: double.infinity,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                        /*          CustomeText(
                                    fontSize: fontSize15.sp,
                                    title: kOrSignInWith,
                                    color: Colors.black,
                                  ),*/

                                  CustomeText(
                                    fontSize: fontSize15.sp,
                                    title: kSignIn,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width:fontSize20.w,
                                  ),
                                  Expanded(
                                    child: Container(
                                      color: kColorButtom,
                                      height: 1,
                                      width: double.infinity,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: getProportionateScreenWidth(15),
                              ),
                              Form(
                                  key: _fromKey,
                                  child: Column(
                                    children: [
                                      BildeTextEmail(),
                                      SizedBox(
                                        height: getProportionateScreenWidth(15),
                                      ),
                                      BildeTextPassword(),
                                      SizedBox(
                                        height: getProportionateScreenWidth(20),
                                      ),

                                      Obx(() {
                                        return SizedBox(
                                          height:54.h,

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
                                    ],
                                  )),
                              SizedBox(
                                height: getProportionateScreenWidth(25),
                              ),
                              CustomeText(
                                fontSize: getProportionateScreenWidth(14),
                                title: kLoginAsVisitor,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                press: () {
                                  Get.offAll(() => HomePageScreen(typeGender: widget.typeGender,),
                                      transition: Transition.rightToLeftWithFade);
                             /*     Get.offAll(() => ViewAllProduct(entityCategories: getIt<GetCategoriesList>().listCategories[0].listSubCat![0]!,),
                                      transition: Transition.rightToLeftWithFade);*/
                                  //   Get.to(ForeGetPassword());
                                },
                              ),
                              SizedBox(
                                height: getProportionateScreenWidth(25),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Get.to(ForGetPassword());
                                },
                                child: CustomeText(
                                  fontSize: getProportionateScreenWidth(14),
                                  title: kForgot_Password,
                                  color: Colors.grey,
                                  press: () {
                                   Get.to(() => ViewForgetPass());

                                    //   Get.to(ForeGetPassword());
                                  },
                                ),
                              ),
                              SizedBox(
                                height: getProportionateScreenWidth(20),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    kNeedAccount.tr,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: getProportionateScreenWidth(13),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(3),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                       Get.to(() => ViewRegister());
                                      },
                                      child: Text(
                                        kSignUp.tr,
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: getProportionateScreenWidth(13),
                                            fontWeight: FontWeight.bold),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: getProportionateScreenWidth(10),
                              ),
                             // FooterLogin(),
                            ],
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


  Widget BildeTextEmail() {
    return CustomTextFilledPhone(
      lable: kMobileNumber,
      //    iconsvg: "assets/icons/Mail.svg",
      hintText: kMobileNumber,
      controller: _textEditingControllerPhoneNumber,
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

        Widget BildeTextPassword() {
      return CustomTextFilledPassword(
          lable: kPassword,
          iconsvg: "assets/icons/Lock.svg",
        hintText: kPassword,
        type: 1,
        isNotEmpty: password.length >= 1 ?true:false,
        controller: _textEditingControllerPassword,
        onChanged: (value) {
          password =value;
          setState(() {});
          return null;

          //password = value;
        },
        validator: (value) {
          if (value!.length == 0) {
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


  void LoginUser() {
    var bodyData = {
      "mobile": _textEditingControllerPhoneNumber!.text,
      "password": _textEditingControllerPassword!.text,

    };
    print(bodyData);
    LoginControllerx.LoginUser(bodyData,_textEditingControllerPhoneNumber!.text,typeGender: widget.typeGender);

  }


}
