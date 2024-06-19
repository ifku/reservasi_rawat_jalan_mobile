import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/entities/token_entity.dart';

class TokenModel extends TokenEntity {
  const TokenModel(
      {required super.accessToken,
      required super.tokenType,
      required super.expiresIn});

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
      };
}
