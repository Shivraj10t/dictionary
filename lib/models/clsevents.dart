// To parse this JSON data, do
//
//     final Events = EventsFromJson(jsonString);

import 'dart:convert';

Events EventsFromJson(String str) => Events.fromJson(json.decode(str));

String EventsToJson(Events data) => json.encode(data.toJson());

class Events {
  Events({
    required this.message,
    required this.status,
    required this.data,
  });

  String message;
  int status;
  List<Datum> data;

  factory Events.fromJson(Map<String, dynamic> json) => Events(
        message: json["message"],
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.eventId,
    required this.title,
    required this.date,
    this.eventImage,
    required this.description,
  });

  int eventId;
  String title;
  String date;
  dynamic eventImage;
  String description;

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
        "description": description
      };
}
