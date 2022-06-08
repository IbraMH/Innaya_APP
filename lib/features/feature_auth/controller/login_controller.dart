import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:innaya_app/core/PreferenceUtils.dart';
import 'package:innaya_app/core/init_app.dart';
import 'package:innaya_app/core/usecases/params.dart';
import 'package:innaya_app/features/feature_auth/data/model/result_respone.dart';
import 'package:innaya_app/features/feature_auth/data/repositories/user_repositories.dart';
import 'package:innaya_app/features/feature_auth/domain/usecase/change_pass.dart';
import 'package:innaya_app/features/feature_auth/domain/usecase/login_user.dart';
import 'package:innaya_app/features/feature_auth/domain/usecase/login_with_social_user.dart';
import 'package:innaya_app/features/feature_auth/domain/usecase/send_sms_forget_pass.dart';
import 'package:innaya_app/features/feature_auth/domain/usecase/verify_account.dart';
import 'package:innaya_app/features/feature_auth/domain/usecase/verify_account.dart';
import 'package:innaya_app/features/feature_auth/domain/usecase/verify_account.dart';
import 'package:innaya_app/features/feature_auth/presntation/view/view_edite_password.dart';
import 'package:innaya_app/features/feature_auth/presntation/view/view_login.dart';
import 'package:innaya_app/features/feature_auth/presntation/view/view_verfication_code.dart';
import 'package:innaya_app/features/feature_home/presntation/view/home_screen.dart';
import 'package:innaya_app/localization/lang/message.dart';
import 'package:innaya_app/utility/shared_method.dart';
import 'package:get/get.dart';

import '../../../utility/utility.dart';
import '../domain/usecase/fcm_user.dart';

class LoginController extends GetxController{
  var state=1.obs;
  var isRefreshDrawer=false.obs;
  var isRefresh=false.obs;
  String token="";
  String typeDevice="";


  getToken() async {
    token = (await FirebaseMessaging.instance.getToken())!;

    print(token);
    return token;
  }
  getTypeDevice() {
    if(Platform.isIOS){
      typeDevice="ios" ;
    }else{
      typeDevice="android" ;

    }

    return typeDevice;
  }

  Future  LoginUser(var body,String mobile, {int typeGender = 1}) async {
    try {
      state.value = 2;

      getIt<loginUser>().call(Params(body: body)).then((value) {
        value.fold((l) {
          state.value = 1;
        }, (respone) async {
          if (respone != null) {
            state.value = 1;

            if (respone!.status!) {
              if (PreferenceUtils.getUser()!.otp_verify == "0") {
                Get.to(() => ViewVerficationCode(phoneNumber: mobile,),
                    transition: Transition.rightToLeftWithFade);
                isRefreshDrawer.value = true;
              } else {
                await PreferenceUtils.setLogin(true);
                sendFcmUser();

                Get.offAll(() => HomePageScreen(typeGender: 1,),
                    transition: Transition.rightToLeftWithFade);
                snackSuccess(title: kDone.tr, body: respone.message);
               // ToastSuccess(msg: respone.message);

              }
              // PreferenceUtils.setLogin(true);


            } else {
              snackError(title: kErorr.tr, body: respone.message);
            }
          }
        });
      });
    } catch (e) {} finally {


    }



  }
  void sendFcmUser() {
    var bodyData = {
      "device_id":Utility.deviceId,
      "fcm_token":token,
      "user_agent":typeDevice,

    };
    print(bodyData);
    getIt<fcmUser>().call(Params(body: bodyData));
  }
  Future VerifyAccountUser(var body) async {
    try {
      state.value = 2;

      getIt<VerifyAccount>().call(Params(body: body)).then((value) {
        value.fold((l) {
          state.value = 1;
        }, (respone) async {
          if (respone != null) {
            state.value = 1;

            if (respone!.status!) {
              Get.offAll(() => HomePageScreen(typeGender: 1,),
                  transition: Transition.rightToLeftWithFade);
              //ToastSuccess(msg: respone.message);

              snackSuccess(title: kDone.tr, body: respone.message);
             await PreferenceUtils.setLogin(true);
            } else {
              isRefresh.value=true;
              snackError(title: kErorr.tr, body: respone.message);
            }
          }
        });
      });
    } catch (e) {} finally {


    }
  }

  Future loginWithSocial(var body) async {
    try {
      state.value = 2;

      getIt<loginWithSocialUser>().call(Params(body: body)).then((value) {
        value.fold((l) {
          state.value = 1;
        }, (respone) async {
          if (respone != null) {
            state.value = 1;

            if (respone!.status!) {
             // ToastSuccess(msg: respone.message);
              sendFcmUser();
              Get.offAll(() => HomePageScreen(typeGender: 1,),
                  transition: Transition.rightToLeftWithFade);;
              snackSuccess(title: kDone.tr, body: respone.message);
              await PreferenceUtils.setLogin(true);
            } else {
              snackError(title: kErorr.tr, body: respone.message);
            }
          }
        });
      });
    } catch (e) {} finally {


    }
  }

  Future sendSmsForget(var body,String mobile) async {
    try {
      state.value = 2;

      getIt<SendSmsForgetPass>().call(Params(body: body)).then((value) {
        value.fold((l) {
          state.value = 1;
        }, (respone) async {
          if (respone != null) {
            state.value = 1;

            if (respone!.status!) {
             // ToastSuccess(msg: respone.message);

              Get.off(() => ViewVerficationCode(type: 2,phoneNumber: mobile,),
                  transition: Transition.rightToLeftWithFade);

              snackSuccess(title: kDone.tr, body: respone.message);
            } else {
              snackError(title: kErorr.tr, body: respone.message);
            }
          }
        });
      });
    } catch (e) {} finally {


    }
  }

  Future VerifyForgetPass(var body) async {
    try {
      state.value = 2;

      getIt<VerifyAccount>().call(Params(body: body)).then((value) {
        value.fold((l) {
          state.value = 1;
        }, (respone) async {
          if (respone != null) {
            state.value = 1;

            if (respone!.status!) {
            //  ToastSuccess(msg: respone.message);

              Get.offAll(() => EditePasswordUser(isFoget: true,),
                  transition: Transition.rightToLeftWithFade);
              snackSuccess(title: kDone.tr, body: respone.message);
            } else {
              isRefresh.value=true;

              snackError(title: kErorr.tr, body: respone.message);
            }
          }
        });
      });
    } catch (e) {} finally {


    }
  }

  Future changePass(var body,int type) async {
    try {
      state.value = 2;

      getIt<ChangePass>().call(Params(body: body,type: type)).then((value) {
        value.fold((l) {
          state.value = 1;
        }, (respone) async {
          if (respone != null) {
            state.value = 1;

            if (respone!.status!) {
              if(type==1){
              //  ToastSuccess(msg: respone.message);
                Get.offAll(() => ViewLogin(),
                    transition: Transition.rightToLeftWithFade);
                snackSuccess(title: kDone.tr, body: respone.message);

              }else{
                 Get.back();
                 snackSuccess(title: kDone.tr, body: respone.message);

              }
            } else {
              snackError(title: kErorr.tr, body: respone.message);
            }
          }
        });
      });
    } catch (e) {} finally {


    }
  }

  @override
  void onInit() {
    getToken();
    getTypeDevice();
    // TODO: implement onInit
    super.onInit();
  }
}