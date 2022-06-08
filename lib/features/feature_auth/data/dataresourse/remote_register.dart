import 'dart:convert';import 'dart:io';import 'package:innaya_app/core/api_config.dart';import 'package:innaya_app/features/feature_auth/data/model/result_respone.dart';import 'package:innaya_app/features/feature_auth/data/model/user.dart';import 'package:innaya_app/localization/lang/message.dart';import 'package:http/http.dart' as http;import 'package:innaya_app/core/PreferenceUtils.dart';abstract class RemoteRegisterResourse{  Future<ResultRespone>registerAndUpdeUser(Map<String, Object> mapData,int type);}class RemoteRegisterResourseImpl implements RemoteRegisterResourse{  @override  Future<ResultRespone> registerAndUpdeUser(Map<String, Object> mapData,int type) async {    ResultRespone mResultRespone;    // TODO: implement registerUser    var request;    if(type==1) {      request = http.MultipartRequest(          'POST', Uri.parse('${apiUrl}customer/register'));      request.fields.addAll({        'name': mapData[kFullName].toString(),        'mobile': mapData[kMobileNumber].toString(),        'password': mapData[kPassword].toString(),        'password_confirmation': mapData[kConfirmPassword].toString(),        'question_id': mapData[kChooseQuestion].toString(),        'answer': mapData[kAnswe].toString(),        'email': mapData[kEmail].toString(),      });      File? file = mapData[kCoverPhoto] as File?;      request.files.add(await http.MultipartFile.fromPath(        'img',        file!.path,        filename: 'image.jpg',      ));      request.headers.addAll(Header(3));      http.StreamedResponse responses = await request.send();      final response = await http.Response.fromStream(responses);      if (response.statusCode == 200) {        var jsonDatapject = jsonDecode(response.body);        // newProductNewList = ProductNewList.fromJson(jsonDatapject);        await PreferenceUtils.setUser(User.fromJson(jsonDatapject['data']));        await PreferenceUtils.setToken(jsonDatapject['token']);        mResultRespone =            ResultRespone(status: true, message: jsonDatapject['message']);        print(response.body);      } else {        print(response.statusCode);        var jsonDatapject = jsonDecode(response.body);        mResultRespone =            ResultRespone(status: false, message: jsonDatapject['message']);      }    }else{      request = http.MultipartRequest(          'POST', Uri.parse('${apiUrl}customer/update/profile'));      request.fields.addAll({        'name': mapData[kFullName].toString(),        'email': mapData[kEmail].toString(),      });      File? file = mapData[kCoverPhoto] as File?;      if(file!.path!="2"){        request.files.add(await http.MultipartFile.fromPath(          'img',          file!.path,          filename: 'image.jpg',        ));      }      request.headers.addAll(Header(3));      http.StreamedResponse responses = await request.send();      final response = await http.Response.fromStream(responses);      if (response.statusCode == 200) {        var jsonDatapject = jsonDecode(response.body);        // newProductNewList = ProductNewList.fromJson(jsonDatapject);        await PreferenceUtils.setUser(User.fromJson(jsonDatapject['data']));       // await PreferenceUtils.setToken(jsonDatapject['token']);        mResultRespone =            ResultRespone(status: true, message: jsonDatapject['message']);        print(response.body);      } else {        print(response.statusCode);        var jsonDatapject = jsonDecode(response.body);        mResultRespone =            ResultRespone(status: false, message: jsonDatapject['message']);      }    }    // print(url);    return mResultRespone;  } /* Future<User>regiasterUser(Map<String, Object> mapRegiaster) async {    var request = http.MultipartRequest(        'POST', Uri.parse('${apiUrl}merchant/register'));    request.fields.addAll({      'name':mapRegiaster[kEmployeeName].toString(),      'mobile': mapRegiaster[kStoreArabic].toString(),      'password': mapRegiaster[kStoreEnglish].toString(),      'password_confirmation': mapRegiaster[kDescriptionArabic].toString(),      'question_id': mapRegiaster[kDescriptionEnglish].toString(),      'answer':  mapRegiaster[kLocationStore].toString(),      'email':  mapRegiaster[kState].toString(),      'img':  mapRegiaster[kCity].toString(),    });    File? file = mapRegiaster[kCoverPhoto] as File?;    request.files.add(await http.MultipartFile.fromPath(      'background',      file!.path,      filename: 'image.jpg',    ));    request.headers.addAll(Header(3));    http.StreamedResponse responses = await request.send();    final response = await http.Response.fromStream(responses);    if (response.statusCode == 200) {      var jsonDatapject = jsonDecode(response.body);      // newProductNewList = ProductNewList.fromJson(jsonDatapject);      mResultRespone =          ResultRespone(status: true, message: jsonDatapject['message']);      print(response.body);    } else {      print(response.statusCode);      var jsonDatapject = jsonDecode(response.body);      mResultRespone =          ResultRespone(status: false, message: jsonDatapject['message']);      print(response.body);      print(response.reasonPhrase);    }    // print(url);    return mResultRespone;  }*/}