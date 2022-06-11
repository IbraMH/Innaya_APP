import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';import 'package:get/get.dart';import 'package:innaya_app/core/init_app.dart';import 'package:innaya_app/core/usecases/params.dart';import 'package:innaya_app/features/feature_home/data/repositories/home_repository.dart';import 'package:innaya_app/features/feature_places/data/repositories/places_repository.dart';import '../../../core/sound.dart';class HomeController extends GetxController{  var isVisible=false.obs;  var departmentSelect=0.obs; var state=1.obs;  showDiloge(){    SmartDialog.showLoading(backDismiss: false,msg: "تحميل ...",);  }  hideDiloge(){    SmartDialog.dismiss();  }  Future <void> getDepartments() async {    await getIt<HomeRepository>().getDepartments();  } Future <void> getSlider() async {   await getIt<HomeRepository>().getSliders(); }  Future <void> getFillter(var body) async {    await getIt<PlaceRepository>().getSearchPlace(body);  }}