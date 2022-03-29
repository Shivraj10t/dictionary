// To parse this JSON data, do
//
//     final clsPlace = clsPlaceFromJson(jsonString);

import 'dart:convert';

ClsPlace clsPlaceFromJson(String str) => ClsPlace.fromJson(json.decode(str));

String clsPlaceToJson(ClsPlace data) => json.encode(data.toJson());

class ClsPlace {
  ClsPlace({
    this.message,
    this.status,
    this.data,
  });

  String? message;
  int? status;
  List<Datum>? data;

  factory ClsPlace.fromJson(Map<String, dynamic> json) => ClsPlace(
        message: json["message"],
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.placeId,
    this.placeName,
    this.placeImage,
    this.description,
  });

  int? placeId;
  String? placeName;
  dynamic placeImage;
  String? description;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        placeId: json["placeId"],
        placeName: json["placeName"],
        placeImage: json["placeImage"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "placeId": placeId,
        "placeName": placeName,
        "placeImage": placeImage,
        "description": description,
      };
}
