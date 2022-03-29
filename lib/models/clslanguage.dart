// To parse this JSON data, do
//
//     final clsLanguage = clsLanguageFromJson(jsonString);

import 'dart:convert';

ClsLanguage clsLanguageFromJson(String str) =>
    ClsLanguage.fromJson(json.decode(str));

String clsLanguageToJson(ClsLanguage data) => json.encode(data.toJson());

class ClsLanguage {
  ClsLanguage({
    this.message,
    this.status,
    this.data,
  });

  String? message;
  int? status;
  List<Datum>? data;

  factory ClsLanguage.fromJson(Map<String, dynamic> json) => ClsLanguage(
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
    this.languageId,
    this.languageName,
  });

  int? languageId;
  String? languageName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        languageId: json["languageId"],
        languageName: json["languageName"],
      );

  Map<String, dynamic> toJson() => {
        "languageId": languageId,
        "languageName": languageName,
      };
}
