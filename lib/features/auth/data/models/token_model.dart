// To parse this JSON data, do
//
//     final tokenModel = tokenModelFromJson(jsonString);

import 'dart:convert';

import 'package:reservasi_rawat_jalan_mobile/features/auth/data/models/user_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/entities/token_entity.dart';

TokenModel tokenModelFromJson(String str) =>
    TokenModel.fromJson(json.decode(str));

String tokenModelToJson(TokenModel data) => json.encode(data.toJson());

class TokenModel extends TokenEntity {
  final String accessToken;
  final String tokenType;
  final int expiresIn;
  final UserModel user;

  const TokenModel({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.user,
  }) : super(
            accessToken: accessToken,
            tokenType: tokenType,
            expiresIn: expiresIn,
            user: user);

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
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
