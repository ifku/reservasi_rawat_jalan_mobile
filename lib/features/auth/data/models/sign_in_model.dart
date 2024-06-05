// To parse this JSON data, do
//
//     final tokenModel = tokenModelFromJson(jsonString);

import 'dart:convert';

import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/entities/sign_in_entity.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/data/models/user_model.dart';

SignInModel signInModelFromJson(String str) =>
    SignInModel.fromJson(json.decode(str));

String signInModelToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel extends SignInEntity {
  final UserModel user;

  const SignInModel({
    required super.accessToken,
    required super.tokenType,
    required super.expiresIn,
    required this.user,
  }) : super(user: user);

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        user: UserModel.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
        "user": user.toJson(),
      };
}
