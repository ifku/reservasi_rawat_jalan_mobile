import 'package:equatable/equatable.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/entities/user_entity.dart';

class TokenEntity extends Equatable {
  final String accessToken;
  final String tokenType;
  final int expiresIn;
  final UserEntity user;

  const TokenEntity({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.user,
  });

  @override
  List<Object> get props => [accessToken, tokenType, expiresIn, user];
}