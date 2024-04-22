import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';
import 'package:reservasi_rawat_jalan_mobile/core/usecase/usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/entities/token_entity.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/repositories/token_repository.dart';

class SaveTokenUseCase implements UseCase<bool, TokenEntity> {
  final TokenRepository _tokenRepository = locator<TokenRepository>();

  @override
  Future<Either<Exception, bool>> call(TokenEntity params) async {
    return await _tokenRepository.saveAccessToken(params);
  }
}
