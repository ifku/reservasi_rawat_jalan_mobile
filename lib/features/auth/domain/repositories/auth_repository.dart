import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/models/otp_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/models/signup_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/models/token_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/entities/token_entity.dart';

abstract class AuthRepository {
  Future<Either<Exception, SignUpModel>> signUp(String email, String nik);

  Future<Either<Exception, TokenEntity>> signIn(String email, String otp);

  Future<Either<Exception, OtpModel>> sendOtp(String email);

  Future<Either<Exception, TokenModel>> refreshToken();

  Future<Either<Exception, String>> signOut();
}
