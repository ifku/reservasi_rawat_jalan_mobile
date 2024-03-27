import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Exception, String>> signUp(String email);

  Future<Either<Exception, String>> signIn(String email, int otp);

  Future<Either<Exception, String>> sendOtp(String email);

  Future<Either<Exception, String>> refreshToken();

  Future<Either<Exception, String>> signOut();
}
