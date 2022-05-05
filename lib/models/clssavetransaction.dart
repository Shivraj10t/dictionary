// To parse this JSON data, do
//
//     final clsSaveTransaction = clsSaveTransactionFromJson(jsonString);

import 'dart:convert';

ClsSaveTransaction clsSaveTransactionFromJson(String str) =>
    ClsSaveTransaction.fromJson(json.decode(str));

String clsSaveTransactionToJson(ClsSaveTransaction data) =>
    json.encode(data.toJson());

class ClsSaveTransaction {
  ClsSaveTransaction({
    this.message,
    this.status,
    this.data,
  });

  String? message;
  int? status;
  Data? data;

  factory ClsSaveTransaction.fromJson(Map<String, dynamic> json) =>
      ClsSaveTransaction(
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
    this.transactionId,
  });

  int? transactionId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        transactionId: json["transactionId"],
      );

  Map<String, dynamic> toJson() => {
        "transactionId": transactionId,
      };
}
