import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';
import 'package:reservasi_rawat_jalan_mobile/core/usecase/usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/entities/token_entity.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/repositories/token_repository.dart';

class GetTokenUseCase implements UseCase<TokenEntity, void> {
  final TokenRepository _tokenRepository = locator<TokenRepository>();

  @override
  Future<Either<Exception, TokenEntity>> call(void params) async {
    return await _tokenRepository.getAccessToken();
  }
}
