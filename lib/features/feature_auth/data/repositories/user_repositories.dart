import 'package:connectivity/connectivity.dart';
import 'package:innaya_app/features/feature_auth/data/dataresourse/remote_user.dart';
import 'package:innaya_app/features/feature_auth/data/model/questions.dart';
import 'package:innaya_app/features/feature_auth/data/model/result_respone.dart';

class UserRepositories{
  List<QuestionsData>?listQuestions=[];

  final RemoteUser ?remoteUser;

  UserRepositories({this.remoteUser});

  Future< List<QuestionsData>?>getQuestion() async {

    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      return listQuestions;
    } else {
      listQuestions=  await remoteUser!.getQuestion() as List<QuestionsData>;
      return listQuestions;
    }
  }

  Future< ResultRespone?>registerUser(Map<String, Object> mapRegiaster) async {
    ResultRespone ?mResultRespone;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return mResultRespone;
    } else {
      mResultRespone=  await remoteUser!.regiasterUser(mapRegiaster) as ResultRespone;
      return mResultRespone;
    }
  }



  Future< ResultRespone?>updateUser(Map<String, Object> mapRegiaster) async {
    ResultRespone ?mResultRespone;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return mResultRespone;
    } else {
      mResultRespone=  await remoteUser!.updateUser(mapRegiaster) as ResultRespone;
      return mResultRespone;
    }
  }

  Future< ResultRespone?>LoginUser(var body) async {
    ResultRespone ?mResultRespone;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return mResultRespone;
    } else {
      mResultRespone=  await remoteUser!.LoginUser(body) as ResultRespone;
      return mResultRespone;
    }
  }
  Future< ResultRespone?>forGetPass(var body) async {
    ResultRespone ?mResultRespone;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return mResultRespone;
    } else {
      mResultRespone=  await remoteUser!.forGetPassword(body) as ResultRespone;
      return mResultRespone;
    }
  }
  Future< ResultRespone?>restPassword(var body) async {
    ResultRespone ?mResultRespone;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return mResultRespone;
    } else {
      mResultRespone=  await remoteUser!.restPassword(body) as ResultRespone;
      return mResultRespone;
    }
  }
}