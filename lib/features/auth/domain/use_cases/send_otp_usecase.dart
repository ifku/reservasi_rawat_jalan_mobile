import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';
import 'package:reservasi_rawat_jalan_mobile/core/usecase/usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/entities/otp_entity.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/repositories/auth_repository.dart';

class SendOtpUseCase extends UseCase<OtpEntity, String> {
  final AuthRepository _authRepository = locator<AuthRepository>();

  @override
  Future<Either<Exception, OtpEntity>> call(String params) async {
    return await _authRepository.sendOtp(params);
  }
}
