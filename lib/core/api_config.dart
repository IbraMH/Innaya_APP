import 'package:innaya_app/core/PreferenceUtils.dart';
import 'package:innaya_app/utility/utility.dart';

const String mainUrl = "http://carrentaltripleq.link";
const String apiUrl = "$mainUrl/api/v1/";
const bool enableFaker = true;

Map<String, String> Header(int typeToken) {
  Map<String, String> headers = {};
  if (typeToken == 0) {
    print("Header");
    print(Utility.deviceId);
    headers = {
      'Content-Type': 'application/json',
      'X-localization': 'ar',
      'device-id': Utility.deviceId,
      'Authorization': 'Bearer ${PreferenceUtils.getToken()}',

      // 'city-id':"${(PreferenceUtils.getCityState()==null)?"":PreferenceUtils.getCityState()!.id}",
    };
  } else if (typeToken == 1) {
    headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${PreferenceUtils.getToken()}',
      'X-localization': 'ar',
      'Charset': 'utf-8',
      //  'city-id':"${(PreferenceUtils.getCityState()==null)?"":PreferenceUtils.getCityState()!.id}",
    };
    print("Bearer ${PreferenceUtils.getToken()}");
  } else if (typeToken == 2) {
    headers = {
      'Content-Type': 'application/json',
      'X-localization': 'ar',
      'Authorization': 'Bearer ${PreferenceUtils.getToken()}',
      // 'city-id':"${(PreferenceUtils.getCityState()==null)?"":PreferenceUtils.getCityState()!.id}",
    };
    print("Authorization");
  } else if (typeToken == 3) {
    headers = {
      //'Authorization': 'Bearer ${PreferenceUtils.getToken()}',
      'X-localization': 'ar',
      'device-id': Utility.deviceId,
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer ${PreferenceUtils.getToken()}',
      // 'city-id':"${(PreferenceUtils.getCityState()==null)?"":PreferenceUtils.getCityState()!.id}",
    };
    print("Bearer ${PreferenceUtils.getToken()}");

    print("Authorization");
  } else if (typeToken == 4) {
    headers = {
      'Authorization': 'Bearer ${PreferenceUtils.getToken()}',
      // 'city-id':"${(PreferenceUtils.getCityState()==null)?"":PreferenceUtils.getCityState()!.id}",
    };
  }
  print("Bearer ${PreferenceUtils.getToken()}");

  print("Authorization");
  return headers;


}
class Api{
  static getBrand() {
    return "${apiUrl}customer/get/brands";
  }
  static getVehicleType() {
    return "${apiUrl}customer/get/vehicleType";
  }
  static getCityUrl() {
    return "${apiUrl}customer/get/cities";
  }

  static getTypeCare() {
    return "${apiUrl}get/vehicleType";
  }

  static geCaresByBrand(int id,int pageNumber) {
    return "${apiUrl}customer/get/brand/vehicles?brand_id=$id&page=$pageNumber";
  }
  static geCaresByFillter(var body,int pageNumber) {
    return "${apiUrl}filter/vehicle?page=$pageNumber";
  }
  static geAddOrder() {
    return "${apiUrl}reservation/customers/make";
  }

  static geMyOrder(int pageNumber) {
    return "${apiUrl}reservation/customers/show?page=$pageNumber";
  }
  static cancelOrder(int id) {
    return "${apiUrl}reservation/customers/cancel/$id";

  }
  static getDetailsCar(int id) {
    return "${apiUrl}customer/show/vehicle?vehicle_id=$id";

  }

  static addToFavorites() {
    return "${apiUrl}add/vehicle/favorites";
  }
  static removeToFavorites() {
    return "${apiUrl}remove/vehicle/favorites";
  }
  static getFavorites() {
    return "${apiUrl}vehicles/favorites";
  }
}
