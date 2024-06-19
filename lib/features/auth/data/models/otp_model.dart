// To parse this JSON data, do
//
//     final otpModel = otpModelFromJson(jsonString);

import 'dart:convert';

import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/entities/otp_entity.dart';

OtpModel otpModelFromJson(String str) => OtpModel.fromJson(json.decode(str));

String otpModelToJson(OtpModel data) => json.encode(data.toJson());

class OtpModel extends OtpEntity {
  const OtpModel({
    required super.otp,
    required super.expirationTime,
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
