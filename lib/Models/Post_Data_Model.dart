// To parse this JSON data, do
//
//     final patientdata = patientdataFromJson(jsonString);

import 'dart:convert';

Patientdata patientdataFromJson(String str) => Patientdata.fromJson(json.decode(str));

String patientdataToJson(Patientdata data) => json.encode(data.toJson());

class Patientdata {
  Patientdata({
    this.data,
    this.msg,
    this.status,
  });

  List<Datum>? data;
  String? msg;
  String? status;

  factory Patientdata.fromJson(Map<String, dynamic> json) => Patientdata(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    msg: json["msg"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "msg": msg,
    "status": status,
  };
}

class Datum {
  Datum({
    this.patientId,
    this.patientImage,
    this.patientName,
    this.patientMobile,
    this.patientEmail,
  });

  String? patientId;
  String? patientImage;
  String? patientName;
  String? patientMobile;
  String? patientEmail;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    patientId: json["patient_id"],
    patientImage: json["patient_image"],
    patientName: json["patient_name"],
    patientMobile: json["patient_mobile"],
    patientEmail: json["patient_email"],
  );

  Map<String, dynamic> toJson() => {
    "patient_id": patientId,
    "patient_image": patientImage,
    "patient_name": patientName,
    "patient_mobile": patientMobile,
    "patient_email": patientEmail,
  };
}