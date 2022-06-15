// To parse this JSON data, do
//
//     final department = departmentFromJson(jsonString);

import 'dart:convert';

Department departmentFromJson(String str) => Department.fromJson(json.decode(str));

class Department {
  Department({
    this.id,
    this.nameAr,
    this.nameEn,
    this.descriptionAr,
    this.descriptionEn,
    this.status,
    this.order,
    this.name,
    this.departmentService,
    this.isSelect=false,
  });

  int ?id;
  String? nameAr;
  String ?nameEn;
  String? descriptionAr;
  String ?descriptionEn;
  int? status;
  dynamic order;
  String? name;
  bool  isSelect;

  List<DepartmentService> ?departmentService;

  factory Department.fromJson(Map<String, dynamic> json) {
    List<DepartmentService>listDepartmentService=[];
    if(json["department_service"]!=null){
      json["department_service"].forEach((v) {
        DepartmentService departmentService=DepartmentService.fromJson(v);
        if(departmentService.service!=null){
          listDepartmentService.add(departmentService);
        }
      });
    }
    return Department(
    id: json["id"],
    nameAr: json["name_ar"],
    nameEn: json["name_en"],
    descriptionAr: json["description_ar"],
    descriptionEn: json["description_en"],
    status: json["status"],
    order: json["order"],
    name: json["name"],
    departmentService:listDepartmentService,
  );
  }


}

class DepartmentService {
  DepartmentService({
    this.id,
    this.departmentId,
    this.serviceId,
    this.status,
    this.service,
  });

  int ?id;
  int ?departmentId;
  int? serviceId;
  int? status;
  Service? service;

  factory DepartmentService.fromJson(Map<String, dynamic> json) => DepartmentService(
    id: json["id"],
    departmentId: json["department_id"],
    serviceId: json["service_id"],
    status: json["status"],
    service:json["service"]==null?null: Service.fromJson(json["service"]),
  );

}

class Service {
  Service({
    this.id,
    this.departmentId,
    this.status,
    this.processingTime,
    this.price,
    this.views,
    this.gender,
    this.name,
    this.description,
    this.imageUrl,
    this.imagesUrl,
    this.genderName,
    this.isSelect=false,
    this.rating
  });

  int ?id;
  int? departmentId;
  int ?status;
  int? processingTime;
  int? price;
  dynamic views;
  String ?gender;
  String ?name;
  String ?rating;

  String? description;
  String? imageUrl;
  List<String>? imagesUrl;
  String ?genderName;
  bool  isSelect;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    id: json["id"],
    departmentId: json["department_id"],
    status: json["status"],
    processingTime: json["processing_time"]??"0",
    price: json["price"],
    views: json["views"]??"0",
    rating: json["views"]??"0",
    gender: json["gender"],
    name: json["name"],
    description: json["description"],
    imageUrl: json["image_url"],
    imagesUrl: List<String>.from(json["images_url"].map((x) => x)),
    genderName: json["gender_name"],
  );


}
