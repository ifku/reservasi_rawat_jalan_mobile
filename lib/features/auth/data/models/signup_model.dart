// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/entities/sign_up_entity.dart';

SignUpModel signUpModelFromJson(String str) =>
    SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel extends SignUpEntity {
  final UserRegisterModel user;
  final int otp;
  final int expirationTime;

  const SignUpModel({
    required this.user,
    required this.otp,
    required this.expirationTime,
  }) : super(user: user, otp: otp, expirationTime: expirationTime);

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        user: UserRegisterModel.fromJson(json["user"]),
        otp: json["otp"],
        expirationTime: json["expiration_time"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "otp": otp,
        "expiration_time": expirationTime,
      };
}

class UserRegisterModel extends UserRegisterEntity {
  final String idUser;
  final String userEmail;
  final String userNik;
  final DateTime updatedAt;
  final DateTime createdAt;

  const UserRegisterModel({
    required this.idUser,
    required this.userEmail,
    required this.userNik,
    required this.updatedAt,
    required this.createdAt,
  }) : super(
            idUser: idUser,
            userEmail: userEmail,
            userNik: userNik,
            updatedAt: updatedAt,
            createdAt: createdAt);

  factory UserRegisterModel.fromJson(Map<String, dynamic> json) =>
      UserRegisterModel(
        idUser: json["id_user"],
        userEmail: json["user_email"],
        userNik: json["user_nik"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id_user": idUser,
        "user_email": userEmail,
        "user_nik": userNik,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
      };
}
