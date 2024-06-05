import 'package:equatable/equatable.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/domain/entities/user_entity.dart';

class SignInEntity extends Equatable {
  final String accessToken;
  final String tokenType;
  final int expiresIn;
  final UserEntity user;

  const SignInEntity({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.user,
  });

  @override
  List<Object> get props => [accessToken, tokenType, expiresIn, user];
}