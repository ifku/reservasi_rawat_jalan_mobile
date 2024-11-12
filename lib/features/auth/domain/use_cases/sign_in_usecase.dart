import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/usecase/usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/entities/sign_in_entity.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/repositories/auth_repository.dart';

class SignInUseCase implements UseCase<SignInEntity, Tuple2<String, String>> {
  final AuthRepository _authRepository;
  SignInUseCase(this._authRepository);

  @override
  Future<Either<Exception, SignInEntity>> call(Tuple2<String, String> params) async {
    return await _authRepository.signIn(params.value1, params.value2);
  }
}
