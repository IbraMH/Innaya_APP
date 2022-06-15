

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:innaya_app/core/api_client.dart';
import 'package:innaya_app/core/api_config.dart';
import 'package:innaya_app/features/feature_home/data/model/department.dart';
import 'package:innaya_app/features/feature_home/data/model/slider.dart';

import '../../../../core/error/exceptions.dart';

class HomeRemoteDataSource {
  final ApiClient? client;

  HomeRemoteDataSource(this.client);

  Future<List<Department>> getDepartments() async {
    List<Department>listDepartment=[];


    final response = await client!.get(
      Api.getDepartments(),
      headers: Header(0),
    );

    print( Api.getDepartments());
    print( response.data);

    if (response.statusCode! <= 204) {
      for(var itemData in response.data['data']) {
        Department item = Department.fromJson(itemData);
        listDepartment.add(item);
      }
      return listDepartment;
    } else {
      throw ServerException.fromResponse(response.data);
    }
  }
  Future<List<Sliders>> getSliders() async {
    List<Sliders>listSliders=[];


    final response = await client!.get(
      Api.getSlider(),
      headers: Header(0),
    );

    print( Api.getDepartments());
    print( response.data);

    if (response.statusCode! <= 204) {
      for(var itemData in response.data['data']) {
        Sliders item = Sliders.fromJson(itemData);
        listSliders.add(item);
      }
      return listSliders;
    } else {
      throw ServerException.fromResponse(response.data);
    }
  }

}
