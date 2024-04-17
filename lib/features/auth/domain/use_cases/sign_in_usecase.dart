import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';
import 'package:reservasi_rawat_jalan_mobile/core/usecase/usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/entities/token_entity.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/repositories/auth_repository.dart';

class SignInUseCase implements UseCase<TokenEntity, Tuple2<String, String>> {
  final AuthRepository _authRepository = locator<AuthRepository>();

  @override
  Future<Either<Exception, TokenEntity>> call(Tuple2<String, String> params) async {
    return await _authRepository.signIn(params.value1, params.value2);
  }
}
