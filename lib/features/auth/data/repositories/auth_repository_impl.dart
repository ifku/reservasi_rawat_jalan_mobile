import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/data_sources/auth_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/models/otp_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/models/signup_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/models/token_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _authDataSource = locator<AuthDataSource>();

  @override
  Future<Either<Exception, SignUpModel>> signUp(
      String email, String nik) async {
    return await _authDataSource.signUp(email, nik);
  }

  @override
  Future<Either<Exception, TokenModel>> signIn(String email, String otp) async {
    return await _authDataSource.signIn(email, otp);
  }

  @override
  Future<Either<Exception, OtpModel>> sendOtp(String email) async {
    return await _authDataSource.sendOtp(email);
  }

  @override
  Future<Either<Exception, TokenModel>> refreshToken() async {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, String>> signOut() async {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
