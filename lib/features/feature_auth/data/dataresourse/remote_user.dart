
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:innaya_app/core/PreferenceUtils.dart';
import 'package:innaya_app/features/feature_auth/data/model/result_respone.dart';
import 'package:innaya_app/localization/lang/message.dart';
import 'package:innaya_app/core/api_config.dart';
import 'package:innaya_app/features/feature_auth/data/model/questions.dart';

class RemoteUser{
  List<QuestionsData>?listQuestions=[];
  Future<List<QuestionsData>?> getQuestion() async {
    Map<String, String> HeaderType;
    var url = Uri.parse('${apiUrl}merchant/get/question');
    HeaderType = Header(0);
    List<QuestionsData>?listQuestionsData=[];
    print(url);
    var client = http.Client();
    try {
      var response = await client.get(
        url,
        headers: HeaderType,
      );
      if (response.statusCode == 200) {
        var jsonDatapject = jsonDecode(response.body);
        Questions questions=Questions.fromJson(jsonDatapject);
        listQuestionsData=questions.data!;
        print(jsonDatapject);

      } else {
        var jsonDatapject = jsonDecode(response.body);
        jsonDatapject['message'];
      }
      print("listQuestionsData");
      print(response.body);
      return listQuestionsData;
    } finally {
      client.close();
    }
  }


  Future<ResultRespone>regiasterUser(Map<String, Object> mapRegiaster) async {
    ResultRespone? mResultRespone;

    var request = http.MultipartRequest(
        'POST', Uri.parse('${apiUrl}merchant/register'));
      request.fields.addAll({
        'employee_name':mapRegiaster[kEmployeeName].toString(),
        'name_ar': mapRegiaster[kStoreArabic].toString(),
        'name_en': mapRegiaster[kStoreEnglish].toString(),
        'description_ar': mapRegiaster[kDescriptionArabic].toString(),
        'description_en': mapRegiaster[kDescriptionEnglish].toString(),
        'location':  mapRegiaster[kLocationStore].toString(),
        'city_id':  mapRegiaster[kState].toString(),
        'region_id':  mapRegiaster[kCity].toString(),
        'phone':  mapRegiaster[kPhoneNumber].toString(),
        'mobile':  mapRegiaster[kMobileNumber].toString(),
        'password': mapRegiaster[kPassword].toString(),
        'password_confirmation':  mapRegiaster[kConfirmPassword].toString(),
        'answer':  mapRegiaster[kAnswe].toString(),
        'question_id':  mapRegiaster[kChooseQuestion].toString(),
        'whatsapp':  mapRegiaster[kWhatsApp].toString(),
        'facebook_link':  mapRegiaster[kFacebookLink].toString(),
        'accept_policies':  "1",
      });
    File? file = mapRegiaster[kCoverPhoto] as File?;
    request.files.add(await http.MultipartFile.fromPath(
      'background',
      file!.path,
      filename: 'image.jpg',
    ));
    request.headers.addAll(Header(3));
    http.StreamedResponse responses = await request.send();
    final response = await http.Response.fromStream(responses);
    if (response.statusCode == 200) {
      var jsonDatapject = jsonDecode(response.body);
      // newProductNewList = ProductNewList.fromJson(jsonDatapject);
      mResultRespone =
          ResultRespone(status: true, message: jsonDatapject['message']);

      print(response.body);
    } else {
      print(response.statusCode);
      var jsonDatapject = jsonDecode(response.body);

      mResultRespone =
          ResultRespone(status: false, message: jsonDatapject['message']);
      print(response.body);
      print(response.reasonPhrase);
    }
    // print(url);

    return mResultRespone;
  }
  Future<ResultRespone>updateUser(Map<String, Object> mapRegiaster) async {
    ResultRespone? mResultRespone;

    var request = http.MultipartRequest(
        'POST', Uri.parse('${apiUrl}merchants/update/profile'));
    print('${apiUrl}merchants/update/profile');
    print("kFacebookLink ${mapRegiaster[kFacebookLink].toString()}");
    request.fields.addAll({
      'employee_name':mapRegiaster[kEmployeeName].toString(),
      'name_ar': mapRegiaster[kStoreArabic].toString(),
      'name_en': mapRegiaster[kStoreEnglish].toString(),
      'description_ar': mapRegiaster[kDescriptionArabic].toString(),
      'description_en': mapRegiaster[kDescriptionEnglish].toString(),
      'location':  mapRegiaster[kLocationStore].toString(),
      'city_id':  mapRegiaster[kState].toString(),
      'region_id':  mapRegiaster[kCity].toString(),
      'phone':  mapRegiaster[kPhoneNumber].toString(),
      'mobile':  mapRegiaster[kMobileNumber].toString(),
      'whatsapp':  mapRegiaster[kWhatsApp].toString(),
      'facebook_link': mapRegiaster[kFacebookLink].toString(),

    });

    File? file = mapRegiaster[kCoverPhoto] as File?;
    if(file!.path=="null"){

    }else{
      request.files.add(await http.MultipartFile.fromPath(
        'background',
        file!.path,
        filename: 'image.jpg',
      ));
    }

    request.headers.addAll(Header(3));
    http.StreamedResponse responses = await request.send();
    final response = await http.Response.fromStream(responses);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonDatapject = jsonDecode(response.body);
      print(response.body);
      await PreferenceUtils.setShopeName(jsonDatapject['data']['name']);
      await PreferenceUtils.setShopeImage(jsonDatapject['data']['image_background']);
      await PreferenceUtils.setIDShope(jsonDatapject['data']['id']);
      //await PreferenceUtils.setMyShop(Shop.fromJson(jsonDatapject['data']));
      // newProductNewList = ProductNewList.fromJson(jsonDatapject);
      mResultRespone =
          ResultRespone(status: true, message: jsonDatapject['message']);

      print(response.body);
    } else {
      print(response.statusCode);
      var jsonDatapject = jsonDecode(response.body);

      mResultRespone =
          ResultRespone(status: false, message: jsonDatapject['message']);
      print(response.body);
      print(response.reasonPhrase);
    }
    // print(url);

    return mResultRespone;
  }
  Future<ResultRespone> LoginUser(var vbody) async {
    ResultRespone mResultRespone;
    Map<String, String> HeaderType;
    var url = Uri.parse('${apiUrl}merchant/login');

    // var url = Uri.https(RootUrl, '${pathRootUrl}user/login');
    //  url = RootUrl+"v1/user/login";
    HeaderType = Header(0);
    print(url);
    var client = http.Client();
    try {
      var response = await client.post(
        url,
        headers: HeaderType,
        body: jsonEncode(vbody),
      );
      print(response.statusCode);

      if (response.statusCode == 200) {
        var jsonDatapject = jsonDecode(response.body);
        print(jsonDatapject);
        await PreferenceUtils.setToken(jsonDatapject['token']);
        await PreferenceUtils.setShopeName(jsonDatapject['data']['name']);
        await PreferenceUtils.setShopeImage(jsonDatapject['data']['image_background']);
      //  await PreferenceUtils.setIDShope(jsonDatapject['data']['shop_id'].toString());
        //await PreferenceUtils.setMyShop(Shop.fromJson(jsonDatapject['data']));
        mResultRespone = ResultRespone(status: true);
        print(response.body);
      } else {
        var jsonDatapject = jsonDecode(response.body);
        mResultRespone =
            ResultRespone(status: false, message: jsonDatapject['message']);
      }
      print("Login");
      print(response.body);

      return mResultRespone;
    } finally {
      client.close();
    }
  }
  Future<ResultRespone> forGetPassword(var vbody) async {
    ResultRespone mResultRespone;
    Map<String, String> HeaderType;
    var url = Uri.parse('${apiUrl}merchant/verify/question');

    // var url = Uri.https(RootUrl, '${pathRootUrl}user/login');
    //  url = RootUrl+"v1/user/login";
    HeaderType = Header(0);
    print(url);
    var client = http.Client();
    try {
      var response = await client.post(
        url,
        headers: HeaderType,
        body: jsonEncode(vbody),
      );
      print(response.statusCode);

      if (response.statusCode == 200) {
        var jsonDatapject = jsonDecode(response.body);
        print(jsonDatapject);
        await PreferenceUtils.setToken(jsonDatapject['token']);
       // PreferenceUtils.setShopeName(jsonDatapject['data']['name']);
        mResultRespone = ResultRespone(status: true,message: jsonDatapject['message']);
        print(response.body);
      } else {
        var jsonDatapject = jsonDecode(response.body);
        mResultRespone =
            ResultRespone(status: false, message: jsonDatapject['message']);
      }
      print("Login");
      print(response.body);

      return mResultRespone;
    } finally {
      client.close();
    }
  }
  Future<ResultRespone> restPassword(var vbody) async {
    ResultRespone mResultRespone;
    Map<String, String> HeaderType;
    var url = Uri.parse('${apiUrl}merchant/forgot/password');

    // var url = Uri.https(RootUrl, '${pathRootUrl}user/login');
    //  url = RootUrl+"v1/user/login";
    HeaderType = Header(1);
    print(url);
    var client = http.Client();
    try {
      var response = await client.post(
        url,
        headers: HeaderType,
        body: jsonEncode(vbody),
      );
      print(response.statusCode);

      if (response.statusCode == 200) {
        var jsonDatapject = jsonDecode(response.body);
        print(jsonDatapject);
        await PreferenceUtils.setToken(jsonDatapject['token']??" ");
        // PreferenceUtils.setShopeName(jsonDatapject['data']['name']);
        mResultRespone = ResultRespone(status: true,message: jsonDatapject['message']);
        print(response.body);
      } else {
        var jsonDatapject = jsonDecode(response.body);
        mResultRespone =
            ResultRespone(status: false, message: jsonDatapject['message']);
      }
      print("Login");
      print(response.body);

      return mResultRespone;
    } finally {
      client.close();
    }
  }
}