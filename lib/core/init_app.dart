
import 'package:faker_dart/faker_dart.dart';
import 'package:get_it/get_it.dart';
import 'package:innaya_app/core/network/network_info.dart';
import 'package:innaya_app/features/feature_auth/data/dataresourse/remote_change_pass.dart';
import 'package:innaya_app/features/feature_auth/data/dataresourse/remote_fcm.dart';
import 'package:innaya_app/features/feature_auth/data/dataresourse/remote_login.dart';
import 'package:innaya_app/features/feature_auth/data/dataresourse/remote_register.dart';
import 'package:innaya_app/features/feature_auth/data/dataresourse/remote_send_sms_forget_pass.dart';
import 'package:innaya_app/features/feature_auth/data/dataresourse/remote_verfication_account.dart';
import 'package:innaya_app/features/feature_auth/data/dataresourse/remote_verfication_forget_pass.dart';
import 'package:innaya_app/features/feature_auth/data/repositories/change_pass_repostriy_impl.dart';
import 'package:innaya_app/features/feature_auth/data/repositories/fcm_repostriy_impl.dart';
import 'package:innaya_app/features/feature_auth/data/repositories/login_repostriy_impl.dart';
import 'package:innaya_app/features/feature_auth/data/repositories/register_repostriy_impl.dart';
import 'package:innaya_app/features/feature_auth/data/repositories/send_sms_forget_pass_repostriy_impl.dart';
import 'package:innaya_app/features/feature_auth/data/repositories/verfication_account_repostriy_impl.dart';
import 'package:innaya_app/features/feature_auth/data/repositories/verfication_forget_pass_repostriy_impl.dart';
import 'package:innaya_app/features/feature_auth/domain/repostriy/repostriy_change_pass.dart';
import 'package:innaya_app/features/feature_auth/domain/repostriy/repostriy_fcm.dart';
import 'package:innaya_app/features/feature_auth/domain/repostriy/repostriy_forget_password.dart';
import 'package:innaya_app/features/feature_auth/domain/repostriy/repostriy_login.dart';
import 'package:innaya_app/features/feature_auth/domain/repostriy/repostriy_register.dart';
import 'package:innaya_app/features/feature_auth/domain/repostriy/repostriy_send_sms_forget_password.dart';
import 'package:innaya_app/features/feature_auth/domain/repostriy/repostriy_verfication.dart';
import 'package:innaya_app/features/feature_auth/domain/usecase/change_pass.dart';
import 'package:innaya_app/features/feature_auth/domain/usecase/fcm_user.dart';
import 'package:innaya_app/features/feature_auth/domain/usecase/login_user.dart';
import 'package:innaya_app/features/feature_auth/domain/usecase/register_user.dart';
import 'package:innaya_app/features/feature_auth/domain/usecase/send_sms_forget_pass.dart';
import 'package:innaya_app/features/feature_auth/domain/usecase/verify_account.dart';
import 'package:innaya_app/features/feature_auth/domain/usecase/verify_forget_pass.dart';
import 'package:innaya_app/features/feature_home/data/dataresourse/home_remote_data_source.dart';
import 'package:innaya_app/features/feature_home/data/repositories/home_repository.dart';
import 'package:innaya_app/features/feature_places/data/dataresourse/places_remote_data_source.dart';
import 'package:innaya_app/features/feature_places/data/repositories/places_repository.dart';
import 'package:innaya_app/features/widget/widjet_relase.dart';
import 'package:innaya_app/utility/utility.dart';

import 'PreferenceUtils.dart';
import 'app.dart';
import 'error/failure.dart';
final faker = Faker.instance;


void CreateVisitor()async {
  var bodyData = {
    "device_id":Utility.deviceId,

  };
  print(bodyData);


}

void init() async {
  setupGetIt();
/*  DatabaseHelper.instance.database;
  dbHelper=DatabaseHelper.instance;*/
  await Utility.getUId().then((value) {
    print("deviceId  $value");
    Utility.deviceId=value;
    CreateVisitor();
  });
  await PreferenceUtils.init();
  // Get.create(()=>HomeController());
}
final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  for (var provider in providers) {
    await provider.register(getIt);
  }
  getIt.registerSingleton<WidjetRelase>(WidjetRelase());
  getIt.registerSingleton<NetWorkInfo>(NetWorkInfoImple());

  getIt.registerSingleton<RemoteRegisterResourse>(RemoteRegisterResourseImpl());
  getIt.registerSingleton<RepostriyRegister>(RegisterRepostriyImpl(netWorkInfo: getIt(),registerResourse: getIt()));

  getIt.registerSingleton<RemoteLoginResourse>(RemoteLoginResourseImpl());
  getIt.registerSingleton<RepostriyLogin>(LoginRepostriyImpl(netWorkInfo: getIt(),loginResourse:getIt()));

  getIt.registerSingleton<RemoteVerficationAccount>(RemoteVerficationAccountImpl());
  getIt.registerSingleton<RepostriyVerfication>(VerficationAccountRepostriyImpl(netWorkInfo: getIt(),remoteVerficationAccount:getIt()));


  getIt.registerSingleton<RemoteForgetPassword>(RemoteVerficationForgetPassImpl());
  getIt.registerSingleton<RepostriyVerifyForgetPassword>(VerficationForrgetPassRepostriyImpl(netWorkInfo: getIt(),remoteForgetPassword:getIt()));

  getIt.registerSingleton<RemoteSendSmsForgetPassword>(RemoteSendSmsForgetPassImpl());
  getIt.registerSingleton<RepostriySendSmsForgetPassword>(SendSmsForrgetPassRepostriyImpl(netWorkInfo: getIt(),remoteSendForgetPassword:getIt()));

  getIt.registerSingleton<RemoteChangePass>(RemoteChangePassImpl());
  getIt.registerSingleton<RepostriyChangePass>(ChangePassRepostriyImpl(netWorkInfo: getIt(),remoteChangePass:getIt()));
  getIt.registerSingleton<RemoteFcm>(RemoteFcmImpl());
  getIt.registerSingleton<RepostriyFcm>(RepostriyFcmImpl(netWorkInfo: getIt(),remoteFcm:getIt()));

  getIt.registerLazySingleton(() => ServerFailure());
  getIt.registerLazySingleton(() => regitsrUser(repostriyRegister: getIt()));
  getIt.registerLazySingleton(() => loginUser(repostriyLogin: getIt()));
  getIt.registerLazySingleton(() => fcmUser(repostriyFcm:getIt()));

  getIt.registerLazySingleton(() => VerifyAccount(repostriyVerfication: getIt()));
  getIt.registerLazySingleton(() => VerifyForgetPass(repostriyVerifyForgetPassword:getIt()));
  getIt.registerLazySingleton(() => SendSmsForgetPass(repostriySendSmsForgetPassword:getIt()));
  getIt.registerLazySingleton(() => ChangePass(repostriyChangePass:getIt()));

  getIt.registerLazySingleton(() => HomeRepository(getIt()));
  getIt.registerLazySingleton(() => HomeRemoteDataSource(getIt()));

  getIt.registerLazySingleton(() => PlaceRemoteDataSource(getIt()));
  getIt.registerLazySingleton(() => PlaceRepository(getIt()));

}