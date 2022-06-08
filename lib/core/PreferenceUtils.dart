import 'dart:convert';


import 'package:innaya_app/features/feature_auth/data/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async' show Future;

// ignore: avoid_classes_with_only_static_members
class PreferenceUtils {
  static const PREF_CACHETIME = 'cachedProductTime';
  static const TOKEN = 'TOKEN';
  static const SHOPENAME = 'SHOPENAME';
  static const SHOPIMAGE = 'SHOPIMAGE';
  static const ISLOGIN = 'ISLOGIN';
  static const IDSHOPI = 'IDSHOPI';
  static const USER = 'USER';
  static const CITYSTATE = 'CITYSTATE';

  static Future<SharedPreferences> get _instance async =>
      prefs ??= await SharedPreferences.getInstance();
  static SharedPreferences? prefs;

  static Future<SharedPreferences> init() async {
    prefs = await _instance;
    return prefs!;
  }

  static String getToken() {
    return prefs!.getString(TOKEN) ?? '';
  }
  static Future<bool> setToken(String value) async {
    var prefs = await _instance;
    return prefs.setString(TOKEN, value);
  }
  static String getShopeName() {
    return prefs!.getString(SHOPENAME) ?? '';
  }
  static Future<bool> setShopeName(String value) async {
    var prefs = await _instance;
    return prefs.setString(SHOPENAME, value);
  }
  static String getShopeImage() {
    return prefs!.getString(SHOPIMAGE) ?? '';
  }
  static Future<bool> setShopeImage(String value) async {
    var prefs = await _instance;
    return prefs.setString(SHOPIMAGE, value);
  }
  static int getIDShope() {
    return prefs!.getInt(IDSHOPI) ?? 0;
  }
  static Future<bool> setIDShope(int value) async {
    var prefs = await _instance;
    return prefs.setInt(IDSHOPI, value);
  }
  static int _getInt(String key) {
    return prefs!.getInt(key) ?? 0;
  }
  static Future<bool> setLogin(bool value) async {
    var prefs = await _instance;
    return prefs.setBool(ISLOGIN, value);
  }

  static Future<bool> isLogin() async {
    var prefs = await _instance;
    return prefs.getBool(ISLOGIN)??false;
  }
  static Future<bool> _setInt(String key, int value) async {
    var prefs = await _instance;
    return prefs.setInt(key, value);
  }


  static Future<void> setUser( User value) async {
    var prefs = await _instance;
    var json = jsonEncode(value.toJson());
    prefs.setString(USER, json);
  }
 static User? getUser (){
    if(prefs!.getString(USER)==null){
      return null;
    }else{
      return User.fromJson(jsonDecode(prefs!.getString(USER)!));

    }
  }
/*  static Shop? getMyShop (){
    if(prefs!.getString(SHOPUSER)==null){
      return null;
    }else{
      return Shop.fromJson(jsonDecode(prefs!.getString(SHOPUSER)!));

    }
  }
  static Future<void> setCityState( DataCities value) async {
    var prefs = await _instance;
    var json = jsonEncode(value.toJson());
    prefs.setString(CITYSTATE, json);
  }
  static DataCities? getCityState (){
    if(prefs!.getString(CITYSTATE)==null){
      return null;
    }else{
      print(prefs!.getString(CITYSTATE)!);
      return DataCities.fromJson(jsonDecode(prefs!.getString(CITYSTATE)!),isTypeRegion: false);

    }
  }*/
  static Future<bool> _setString(String key, String value) async {
    var prefs = await _instance;
    return prefs.setString(key, value);
  }

  static Future<bool> _setBool(String key, bool value) async {
    var prefs = await _instance;
    return prefs.setBool(key, value);
  }

  static bool _getBool(String key) {
    return prefs!.getBool(key) ?? true;
  }

  static Future<void> clearAllPreferences() async {
    prefs!.clear();
  }

  static int getCacheTime() {
    return _getInt(PREF_CACHETIME);
  }

  static void setCacheTime(int time) {
    _setInt(PREF_CACHETIME, time);
  }
}
