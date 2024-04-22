import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/entities/token_entity.dart';

abstract class TokenRepository {
  Future<Either<Exception, bool>> saveAccessToken(TokenEntity token);

  Future<Either<Exception, TokenEntity>> getAccessToken();

  Future<Either<Exception, bool>> deleteToken();
}
