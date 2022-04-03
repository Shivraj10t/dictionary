// To parse this JSON data, do
//
//     final clsMeaning = clsMeaningFromJson(jsonString);

import 'dart:convert';

ClsMeaning clsMeaningFromJson(String str) =>
    ClsMeaning.fromJson(json.decode(str));

String clsMeaningToJson(ClsMeaning data) => json.encode(data.toJson());

class ClsMeaning {
  ClsMeaning({
    this.message,
    this.status,
    this.data,
  });

  String? message;
  int? status;
  Data? data;

  factory ClsMeaning.fromJson(Map<String, dynamic> json) => ClsMeaning(
        message: json["message"],
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.meaningId,
    this.word,
    this.wordLanguageId,
    this.meaning,
    this.meaningLanguageId,
    this.date,
    this.wordLanguage,
    this.meaningLanguage,
  });

  int? meaningId;
  String? word;
  int? wordLanguageId;
  String? meaning;
  int? meaningLanguageId;
  DateTime? date;
  String? wordLanguage;
  String? meaningLanguage;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        meaningId: json["meaningId"],
        word: json["word"],
        wordLanguageId: json["wordLanguageId"],
        meaning: json["meaning"],
        meaningLanguageId: json["meaningLanguageId"],
        date: DateTime.parse(json["date"]),
        wordLanguage: json["wordLanguage"],
        meaningLanguage: json["meaningLanguage"],
      );

  Map<String, dynamic> toJson() => {
        "meaningId": meaningId,
        "word": word,
        "wordLanguageId": wordLanguageId,
        "meaning": meaning,
        "meaningLanguageId": meaningLanguageId,
        "date": date,
        "wordLanguage": wordLanguage,
        "meaningLanguage": meaningLanguage,
      };
}
