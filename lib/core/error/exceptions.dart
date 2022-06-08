import 'dart:convert';

import 'package:innaya_app/core/error/failure.dart';


class ServerException implements Exception {
  ServerException();

  Map<String, dynamic>? errors;
  int? statusCode;

  ServerException.errorApi({this.errors, this.statusCode});

  static fromResponse(String body, {int? statusCode}) {
    return ServerException.errorApi(
        errors: json.decode(body), statusCode: statusCode);
  }

  Failure toFailure() {
    return ServerFailure(error: errors, code: statusCode);
  }
}

class CacheException implements Exception {}
class NoCurrentConversationException implements Exception {}
