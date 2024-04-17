import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/entities/otp_entity.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/entities/sign_up_entity.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/entities/token_entity.dart';

abstract class AuthRepository {
  Future<Either<Exception, SignUpEntity>> signUp(String email, String nik);

  Future<Either<Exception, TokenEntity>> signIn(String email, String otp);

  Future<Either<Exception, OtpEntity>> sendOtp(String email);

  Future<Either<Exception, TokenEntity>> refreshToken();

  Future<Either<Exception, String>> signOut();
}
