import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/data_sources/token_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/entities/token_entity.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/repositories/token_repository.dart';

class TokenRepositoryImpl implements TokenRepository {
  final TokenDataSource _tokenDataSource;

  TokenRepositoryImpl(this._tokenDataSource);
  @override
  Future<Either<Exception, bool>> deleteToken() async {
    return await _tokenDataSource.deleteToken();
  }

  @override
  Future<Either<Exception, TokenEntity>> getAccessToken() async {
    return await _tokenDataSource.getAccessToken();
  }

  @override
  Future<Either<Exception, bool>> saveAccessToken(TokenEntity token) async {
    return await _tokenDataSource.saveAccessToken(token);
  }
}
