import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/data/model/token_model.dart';
import 'package:reservasi_rawat_jalan_mobile/domain/repository/auth_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/domain/usecases/usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';

class SignInUseCase implements UseCase<TokenModel, Tuple2<String, String>> {
  final AuthRepository _authRepository = locator<AuthRepository>();

  @override
  Future<Either<Exception, TokenModel>> call(Tuple2<String, String> params) async {
    return await _authRepository.signIn(params.value1, params.value2);
  }
}
