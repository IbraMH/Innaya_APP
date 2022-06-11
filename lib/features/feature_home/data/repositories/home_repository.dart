
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:innaya_app/core/error/exceptions.dart';
import 'package:innaya_app/features/feature_home/data/dataresourse/home_remote_data_source.dart';
import 'package:innaya_app/features/feature_home/data/model/department.dart';
import 'package:innaya_app/features/feature_home/data/model/slider.dart';
import '../../../../core/error/failure.dart';



class HomeRepository {
  final HomeRemoteDataSource? remoteDataSource;
  List<Department> listDepartments=[];
  List<Sliders> listSliders=[];


  HomeRepository(this.remoteDataSource);

  Future<Either<Failure, List<Department>>> getDepartments() async {
    try {

      final obj = await remoteDataSource!.getDepartments();
      listDepartments=obj;
      return Right(listDepartments);
    } on ServerException catch (e) {

      return Left(e.toFailure());
    } catch (error) {

      return Left(ConnectionFailure());
    }
  }

  Future<Either<Failure, List<Sliders>>> getSliders() async {
    try {

      final obj = await remoteDataSource!.getSliders();
      listSliders=obj;
      return Right(listSliders);
    } on ServerException catch (e) {

      return Left(e.toFailure());
    } catch (error) {

      return Left(ConnectionFailure());
    }
  }

}
