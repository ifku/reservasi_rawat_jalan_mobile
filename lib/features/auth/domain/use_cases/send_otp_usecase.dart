import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';
import 'package:reservasi_rawat_jalan_mobile/core/usecase/usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/models/otp_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/repositories/auth_repository.dart';

class SendOtpUseCase extends UseCase<OtpModel, String> {
  final AuthRepository _authRepository = locator<AuthRepository>();

  @override
  Future<Either<Exception, OtpModel>> call(String params) async {
    return await _authRepository.sendOtp(params);
  }
}
