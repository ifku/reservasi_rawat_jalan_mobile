import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/data/model/otp_model.dart';
import 'package:reservasi_rawat_jalan_mobile/data/model/signup_model.dart';
import 'package:reservasi_rawat_jalan_mobile/data/model/token_model.dart';

abstract class AuthRepository {
  Future<Either<Exception, SignUpModel>> signUp(String email, String nik);

  Future<Either<Exception, TokenModel>> signIn(String email, String otp);

  Future<Either<Exception, OtpModel>> sendOtp(String email);

  Future<Either<Exception, TokenModel>> refreshToken();

  Future<Either<Exception, String>> signOut();
}
