// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  final User user;
  final int otp;
  final int expirationTime;

  SignUpModel({
    required this.user,
    required this.otp,
    required this.expirationTime,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
    user: User.fromJson(json["user"]),
    otp: json["otp"],
    expirationTime: json["expiration_time"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "otp": otp,
    "expiration_time": expirationTime,
  };
}

class User {
  final String idUser;
  final String userEmail;
  final String userNik;
  final DateTime updatedAt;
  final DateTime createdAt;

  User({
    required this.idUser,
    required this.userEmail,
    required this.userNik,
    required this.updatedAt,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
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
