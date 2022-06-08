// To parse this JSON data, do
//
//     final questions = questionsFromJson(jsonString);

import 'dart:convert';

Questions questionsFromJson(String str) => Questions.fromJson(json.decode(str));

String questionsToJson(Questions data) => json.encode(data.toJson());

class Questions {
  Questions({
    this.data,
    this.status,
    this.message,
  });

  List<QuestionsData>? data;
  bool ?status;
  String ?message;

  factory Questions.fromJson(Map<String, dynamic> json) => Questions(
    data: List<QuestionsData>.from(json["data"].map((x) => QuestionsData.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class QuestionsData {
  QuestionsData({
    this.id,
    this.textAr,
    this.textEn,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.text,
  });

  int ?id;
  String? textAr;
  String ?textEn;
  int? status;
  DateTime? createdAt;
  DateTime ?updatedAt;
  String ?text;

  factory QuestionsData.fromJson(Map<String, dynamic> json) => QuestionsData(
    id: json["id"],
    textAr: json["text_ar"],
    textEn: json["text_en"],
    status: json["status"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "text_ar": textAr,
    "text_en": textEn,
    "status": status,
    "text": text,
  };
}
