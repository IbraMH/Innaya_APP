import 'package:innaya_app/core/api_client.dart';
import 'package:innaya_app/core/service_provider.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AppServiceProvider extends ServiceProvider {
  static int connectTimeout = 20 * 1000;
  static int sendTimeout = 20 * 1000;
  static int receiveTimeout = 20 * 1000;

  @override
  Future<void> register(GetIt it) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    it.registerLazySingleton(() => sharedPreferences);
    it.registerLazySingleton(() => packageInfo);
    it.registerLazySingleton(() => Dio(BaseOptions(
        connectTimeout: connectTimeout,
        sendTimeout: sendTimeout,
        receiveTimeout: receiveTimeout,
        receiveDataWhenStatusError: true)));
    it.registerLazySingleton(() => ApiClient(it()));


  }

  @override
  T? responseConvert<T>(Map<String, dynamic> json) => null;
}
