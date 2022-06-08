import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List proprites = const <dynamic>[]]) : super();

  @override
  List<Object> get props => [];

  String toMessage() {

    return 'Server Failure';
  }
}

class ServerFailure extends Failure {
  const ServerFailure({this.error, this.code});

  final Map<String, dynamic>? /*?*/ /*?*/ error;
  final int? code;


  String mapFailureToMessage(Failure failure) {
    // Instead of a regular 'if (failure is ServerFailure)...'
    switch (failure.runtimeType) {

      case ServerFailure:

        //stderr.writeln("$code ${error!['message']}");

        return "SERVER_FAILURE_MESSAGE $code";
      default:
        print("UNEXPECTED_ERROR_MESSAGE");

        return "UNEXPECTED_ERROR_MESSAGE";
    }
  }

}
class ConnectionFailure extends Failure {
  @override
  String toMessage() {
    return 'Connection Failure';
  }
}
