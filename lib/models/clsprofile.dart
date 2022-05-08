// To parse this JSON data, do
//
//     final clsProfileLoad = clsProfileLoadFromJson(jsonString);

import 'dart:convert';

ClsProfileLoad clsProfileLoadFromJson(String str) =>
    ClsProfileLoad.fromJson(json.decode(str));

String clsProfileLoadToJson(ClsProfileLoad data) => json.encode(data.toJson());

class ClsProfileLoad {
  ClsProfileLoad({
    this.message,
    this.status,
    this.data,
  });

  String? message;
  int? status;
  Data? data;

  factory ClsProfileLoad.fromJson(Map<String, dynamic> json) => ClsProfileLoad(
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
    this.memberId,
    this.email,
    this.mobile,
    this.password,
    this.registrationStatus,
    this.fullName,
    this.registrationDate,
    this.deviceId,
    this.expiryStatus,
  });

  int? memberId;
  String? email;
  String? mobile;
  String? password;
  String? registrationStatus;
  String? fullName;
  DateTime? registrationDate;
  String? deviceId;
  String? expiryStatus;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        memberId: json["memberId"],
        email: json["email"],
        mobile: json["mobile"],
        password: json["password"],
        registrationStatus: json["registrationStatus"],
        fullName: json["fullName"],
        registrationDate: DateTime.parse(json["registrationDate"]),
        deviceId: json["deviceId"],
        expiryStatus: json["expiryStatus"],
      );

  Map<String, dynamic> toJson() => {
        "memberId": memberId,
        "email": email,
        "mobile": mobile,
        "password": password,
        "registrationStatus": registrationStatus,
        "fullName": fullName,
        "registrationDate": registrationDate,
        "deviceId": deviceId,
        "expiryStatus": expiryStatus,
      };
}
