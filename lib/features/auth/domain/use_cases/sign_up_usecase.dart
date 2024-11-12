import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/usecase/usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/entities/sign_up_entity.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/repositories/auth_repository.dart';

class SignUpUseCase implements UseCase<SignUpEntity, Tuple2<String, String>> {
  final AuthRepository _authRepository;

  SignUpUseCase(this._authRepository);

  @override
  Future<Either<Exception, SignUpEntity>> call(
      Tuple2<String, String> params) async {
    return await _authRepository.signUp(params.value1, params.value2);
  }
}
