import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/models/otp_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/models/signup_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/models/sign_in_model.dart';

abstract class AuthDataSource {
  Future<Either<Exception, SignUpModel>> signUp(String email, String nik);

  Future<Either<Exception, SignInModel>> signIn(String email, String otp);

  Future<Either<Exception, OtpModel>> sendOtp(String email);

  Future<Either<Exception, SignInModel>> refreshToken();

  Future<Either<Exception, String>> signOut();
}
