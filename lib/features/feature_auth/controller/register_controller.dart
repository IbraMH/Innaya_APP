import 'package:innaya_app/core/init_app.dart';
import 'package:innaya_app/core/usecases/params_map.dart';
import 'package:innaya_app/features/feature_auth/data/model/result_respone.dart';
import 'package:innaya_app/features/feature_auth/data/repositories/user_repositories.dart';
import 'package:innaya_app/features/feature_auth/domain/usecase/register_user.dart';
import 'package:innaya_app/features/feature_auth/presntation/view/view_edite_password.dart';
import 'package:innaya_app/features/feature_auth/presntation/view/view_login.dart';
import 'package:innaya_app/localization/lang/message.dart';
import 'package:innaya_app/utility/shared_method.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController{
  var state=1.obs;
  var cityName="${kCity.tr}".obs;
  var StateName="${kState.tr}".obs;
  var quation="".obs;
   var buttomIsActive=false.obs;

  Future  getQuation() async{
    try {
      await getIt<UserRepositories>().getQuestion() ;
    }catch (e) {
    }finally{
;

    }
  }
  Future  registerAndUpdateUser(Map<String, Object> mapRegiaster,int type) async{
    try {
      state.value=2;
      getIt<regitsrUser>().call(ParamsMap(mapData:mapRegiaster,type: type )).then((value) {
        value.fold((l) {
            state.value=1;
        }, (respone) {
          if(respone!=null){
            if(respone!.status!){
              if(type==1){
                Get.off(() => ViewLogin(),transition:Transition.rightToLeftWithFade);

              }else{
                Get.back();
              }
              snackSuccess(title:kDone.tr,body:respone.message);

            }else{
              snackError(title:kErorr.tr,body:respone.message);

            }

          }else{
            snackError(title:kErorr.tr,body:kConnectionError.tr);

          }
        });
      });
    }catch (e) {
    }finally{
    //  state.value=1;

    }


  }
  Future  updateUser(Map<String, Object> mapUpdateUser) async{
    try {
      state.value=2;
      ResultRespone? respone=  await getIt<UserRepositories>().updateUser(mapUpdateUser) ;
      if(respone!=null){
        if(respone!.status!){
       //   Get.off(() => ViewLogin(),transition:Transition.rightToLeftWithFade);
          snackSuccess(title:kDone.tr,body:respone.message);

        }else{
          snackError(title:kErorr.tr,body:respone.message);

        }

      }else{
        snackError(title:kErorr.tr,body:kConnectionError.tr);

      }

    }catch (e) {
    }finally{
      ;
      state.value=1;

    }


  }
  Future  checkForGetPass(var body) async{
    try {
      state.value=2;
      ResultRespone? respone=  await getIt<UserRepositories>().forGetPass(body) ;
      if(respone!=null){
        if(respone!.status!){
          Get.off(() => EditePasswordUser(),transition:Transition.rightToLeftWithFade);
          snackSuccess(title:kDone.tr,body:respone.message);

        }else{
          snackError(title:kErorr.tr,body:respone.message);

        }

      }else{
        snackError(title:kErorr.tr,body:kConnectionError.tr);

      }

    }catch (e) {
    }finally{
      ;
      state.value=1;

    }
  }
  Future  restPassword(var body) async{
    try {
      state.value=2;
      ResultRespone? respone=  await getIt<UserRepositories>().restPassword(body) ;
      if(respone!=null){
        if(respone!.status!){
          Get.back();
          snackSuccess(title:kDone.tr,body:respone.message);

        }else{
          snackError(title:kErorr.tr,body:respone.message);

        }

      }else{
        snackError(title:kErorr.tr,body:kConnectionError.tr);

      }

    }catch (e) {
    }finally{
      ;
      state.value=1;

    }
  }
}