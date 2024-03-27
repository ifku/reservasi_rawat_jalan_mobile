// To parse this JSON data, do
//
//     final otpModel = otpModelFromJson(jsonString);

import 'dart:convert';

OtpModel otpModelFromJson(String str) => OtpModel.fromJson(json.decode(str));

String otpModelToJson(OtpModel data) => json.encode(data.toJson());

class OtpModel {
  final int otp;
  final int expirationTime;

  OtpModel({
    required this.otp,
    required this.expirationTime,
  });

  factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
        otp: json["otp"],
        expirationTime: json["expiration_time"],
      );

  Map<String, dynamic> toJson() => {
        "otp": otp,
        "expiration_time": expirationTime,
      };
}
