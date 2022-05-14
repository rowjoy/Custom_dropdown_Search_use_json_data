// To parse this JSON data, do
//
//     final countryDataModel = countryDataModelFromJson(jsonString);

import 'dart:convert';

class CountryDataModel {
  CountryDataModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int? userId;
  int? id;
  String? title;
  String? body;

  factory CountryDataModel.fromRawJson(String str) =>
      CountryDataModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CountryDataModel.fromJson(Map<String, dynamic> json) =>
      CountryDataModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
