import 'dart:async';
import 'dart:convert';

import 'package:innaya_app/core/error/exceptions.dart';
import 'package:dio/dio.dart';
import 'app_service_provider.dart';

// import 'package:retry/retry.dart';

class ApiClient {
  static var logoutFromInterceptors = false;
  final Dio client;

  ApiClient(this.client);

  Future<Response> get(url,
      {required Map<String, String> headers, queryParameters}) async {
    ApiClient.logoutFromInterceptors = false;
    try {
      return await client.get(url,
          queryParameters: queryParameters,
          options: Options(
            headers: headers,
            sendTimeout: AppServiceProvider.sendTimeout,
            receiveTimeout: AppServiceProvider.receiveTimeout,
          ));
    } on DioError catch (e) {

      if (e.response != null && e.response!.data != null) {
        throw ServerException.errorApi(
            errors: e.response!.data, statusCode: e.response?.statusCode ?? 0);
      }
      throw ServerException.errorApi(
          errors: {"message": "$e"}, statusCode:  0);
    } catch (e) {
      throw ServerException.errorApi(errors: {"message": "$e"});
    }
  }

  Future<Response> post(url,
      {required Map<String, String> headers, body, Encoding? encoding}) async {
    ApiClient.logoutFromInterceptors = false;

    try {
      return await client.post(url,
          data: body,
          options: Options(
            headers: headers,
            sendTimeout: AppServiceProvider.sendTimeout,
            receiveTimeout: AppServiceProvider.receiveTimeout,
          ));
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != null) {
        throw ServerException.errorApi(
            errors: e.response!.data, statusCode: e.response?.statusCode ?? 0);
      }

      throw ServerException.errorApi(
          errors: {"message": "$e"}, statusCode:  0);
    } catch (e) {
      throw ServerException.errorApi(errors: {"message": "$e"});
    }
  }

  Future<Response> delete(url,
      {required Map<String, String?> headers, body, Encoding? encoding}) async {
    ApiClient.logoutFromInterceptors = false;

    try {
      return await client.delete(url,
          data: body,
          options: Options(
            headers: headers,
            sendTimeout: AppServiceProvider.sendTimeout,
            receiveTimeout: AppServiceProvider.receiveTimeout,
          ));
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != null) {
        throw ServerException.errorApi(
            errors: e.response!.data, statusCode:  e.response?.statusCode ?? 0);
      }
      throw ServerException.errorApi(
          errors: {"message": "$e"}, statusCode:   0);
    } catch (e) {
      throw ServerException.errorApi(errors: {"message": "$e"});
    }
  }

  Future<Response> put(url,
      {Map<String, dynamic>? headers,
      body,
      Encoding? encoding,
      onSendProgress}) async {
    ApiClient.logoutFromInterceptors = false;

    try {
      return await client.put(url,
          data: body,
          options: Options(
            headers: headers,
            sendTimeout: AppServiceProvider.sendTimeout,
            receiveTimeout: AppServiceProvider.receiveTimeout,
          ),
          onSendProgress: onSendProgress);
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != null) {
        throw ServerException.errorApi(
            errors: e.response!.data, statusCode:  e.response?.statusCode ?? 0);
      }
      throw ServerException.errorApi(
          errors: {"message": "$e"}, statusCode:  0);
    } catch (e) {
      throw ServerException.errorApi(errors: {"message": "$e"});
    }
  }
}


bool checkConversationRequest(DioError err) {
  if (err.response!.realUri.toString().contains('conversations/') &&
      err.requestOptions.method.toLowerCase() == "get") {
    return true;
  }
  return false;
}

class RetryRequest {
  String? url;
  String? routeName;
  String? method;
  dynamic data;
  Map<String, dynamic>? headers;

  RetryRequest(
      {this.url, this.method, this.data, this.headers, this.routeName});
}
