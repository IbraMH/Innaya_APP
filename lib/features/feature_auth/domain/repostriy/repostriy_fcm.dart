import 'package:dartz/dartz.dart';import 'package:innaya_app/core/error/failure.dart';import 'package:innaya_app/features/feature_auth/data/model/result_respone.dart';import 'package:innaya_app/features/feature_auth/data/model/user.dart';abstract class RepostriyFcm {  Future <Either<Failure,ResultRespone>>fcmUser(var data);}