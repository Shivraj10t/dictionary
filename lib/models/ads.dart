// To parse this JSON data, do
//
//     final clsAdds = clsAddsFromJson(jsonString);

import 'dart:convert';

ClsAdds clsAddsFromJson(String str) => ClsAdds.fromJson(json.decode(str));

String clsAddsToJson(ClsAdds data) => json.encode(data.toJson());

class ClsAdds {
  ClsAdds({
    this.message,
    this.status,
    this.data,
  });

  String? message;
  int? status;
  List<Datum>? data;

  factory ClsAdds.fromJson(Map<String, dynamic> json) => ClsAdds(
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
    this.advertisementId,
    this.adTitle,
    this.image,
    this.addLink,
    this.addType,
    this.startDate,
    this.expiryDate,
  });

  int? advertisementId;
  dynamic adTitle;
  String? image;
  String? addLink;
  String? addType;
  String? startDate;
  String? expiryDate;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        advertisementId: json["advertisementId"],
        adTitle: json["adTitle"],
        image: json["image"],
        addLink: json["addLink"],
        addType: json["addType"],
        startDate: json["startDate"],
        expiryDate: json["expiryDate"],
      );

  Map<String, dynamic> toJson() => {
        "advertisementId": advertisementId,
        "adTitle": adTitle,
        "image": image,
        "addLink": addLink,
        "addType": addType,
        "startDate": startDate,
        "expiryDate": expiryDate,
      };
}
