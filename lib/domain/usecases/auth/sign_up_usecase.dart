import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';
import 'package:reservasi_rawat_jalan_mobile/data/model/signup_model.dart';
import 'package:reservasi_rawat_jalan_mobile/domain/repository/auth_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/domain/usecases/usecase.dart';

class SignUpUseCase implements UseCase<SignUpModel, Tuple2<String, String>> {
  final AuthRepository _authRepository = locator<AuthRepository>();

  @override
  Future<Either<Exception, SignUpModel>> call(
      Tuple2<String, String> params) async {
    return await _authRepository.signUp(params.value1, params.value2);
  }
}
