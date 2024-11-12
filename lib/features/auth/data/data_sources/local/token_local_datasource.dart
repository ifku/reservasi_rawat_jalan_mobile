import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/data_sources/token_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/models/token_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/entities/token_entity.dart';

class TokenLocalDataSource implements TokenDataSource {
  final FlutterSecureStorage _storage;

  TokenLocalDataSource(this._storage);

  final accessTokenKey = 'access_token';
  final tokenType = 'token_type';
  final expiresIn = 'expires_in';
  final refreshTokenKey = 'refresh_token';

  @override
  Future<Either<Exception, bool>> saveAccessToken(TokenEntity token) async {
    try {
      await _storage.write(key: 'access_token', value: token.accessToken);
      await _storage.write(key: 'token_type', value: token.tokenType);
      await _storage.write(
          key: 'expires_in', value: token.expiresIn.toString());
      return const Right(true);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, TokenModel>> getAccessToken() async {
    try {
      final String? token = await _storage.read(key: accessTokenKey);
      final String? type = await _storage.read(key: tokenType);
      final String? expires = await _storage.read(key: expiresIn);
      if (token != null) {
        return Right(TokenModel(
            accessToken: token,
            tokenType: type!,
            expiresIn: int.parse(expires!)));
      } else {
        return Left(Exception('Token not found'));
      }
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, bool>> deleteToken() async {
    try {
      await _storage.delete(key: accessTokenKey);
      await _storage.delete(key: tokenType);
      await _storage.delete(key: expiresIn);
      return const Right(true);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
