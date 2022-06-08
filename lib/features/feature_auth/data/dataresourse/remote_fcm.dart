import 'dart:convert';import 'dart:io';import 'package:innaya_app/core/api_config.dart';import 'package:innaya_app/features/feature_auth/data/model/result_respone.dart';import 'package:innaya_app/features/feature_auth/data/model/user.dart';import 'package:innaya_app/localization/lang/message.dart';import 'package:http/http.dart' as http;import 'package:innaya_app/core/PreferenceUtils.dart';abstract class RemoteFcm{  Future<ResultRespone>fcmUser(var body);}class RemoteFcmImpl implements RemoteFcm{  @override  Future<ResultRespone> fcmUser(var body) async {    ResultRespone mResultRespone;    // TODO: implement registerUser    Map<String, String> HeaderType;    var url = Uri.parse('${apiUrl}save/user/fcmToken');    // var url = Uri.https(RootUrl, '${pathRootUrl}user/login');    //  url = RootUrl+"v1/user/login";    HeaderType = Header(0);    print(url);    var client = http.Client();    try {      var response = await client.post(        url,        headers: HeaderType,        body: jsonEncode(body),      );      print("response.statusCode fcm");      print(response.statusCode);      if (response.statusCode == 200) {        var jsonDatapject = jsonDecode(response.body);        print(jsonDatapject);        mResultRespone=ResultRespone(status: true, message: jsonDatapject['message']);        //  await PreferenceUtils.setIDShope(jsonDatapject['data']['shop_id'].toString());        //await PreferenceUtils.setMyShop(Shop.fromJson(jsonDatapject['data']));        print(response.body);      } else {        var jsonDatapject = jsonDecode(response.body);        mResultRespone =            ResultRespone(status: false, message: jsonDatapject['message']);      }      print("Login");      print(response.body);      return mResultRespone;    } finally {      client.close();    }    // print(url);    return mResultRespone;  }}