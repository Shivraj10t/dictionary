// To parse this JSON data, do
//
//     final events = eventsFromJson(jsonString);

import 'dart:convert';

ClsEvents eventsFromJson(String str) => ClsEvents.fromJson(json.decode(str));

String eventsToJson(ClsEvents data) => json.encode(data.toJson());

class ClsEvents {
  ClsEvents({
    this.message,
    this.status,
    this.data,
  });

  String? message;
  int? status;
  List<Datum>? data;

  factory ClsEvents.fromJson(Map<String, dynamic> json) => ClsEvents(
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
    this.eventId,
    this.title,
    this.date,
    this.eventImage,
    this.description,
  });

  int? eventId;
  String? title;
  String? date;
  dynamic eventImage;
  String? description;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        eventId: json["eventId"],
        title: json["title"],
        date: json["date"],
        eventImage: json["eventImage"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "eventId": eventId,
        "title": title,
        "date": date,
        "eventImage": eventImage,
        "description": description,
      };
}
