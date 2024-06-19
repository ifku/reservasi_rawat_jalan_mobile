import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/models/token_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/entities/token_entity.dart';

abstract class TokenDataSource {
  Future<Either<Exception, bool>> saveAccessToken(TokenEntity token);

  Future<Either<Exception, TokenModel>> getAccessToken();

  Future<Either<Exception, bool>> deleteToken();
}
