import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/const/api_constants.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';
import 'package:reservasi_rawat_jalan_mobile/core/model/api_response.dart';
import 'package:reservasi_rawat_jalan_mobile/core/network/http_client.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/data_sources/auth_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/models/otp_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/models/signup_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/models/token_model.dart';

class AuthRemoteDataSource implements AuthDataSource {
  final AppHttpClient client = locator<AppHttpClient>();

  @override
  Future<Either<Exception, SignUpModel>> signUp(
      String email, String nik) async {
    final response = await client.post(
      ApiConstants.signUp,
      data: {
        'user_email': email,
        'user_nik': nik,
      },
    );

    return response.fold(
      (error) => Left(error),
      (data) {
        final responseObj = ApiResponse<SignUpModel>.fromJson(data, (p0) {
          return SignUpModel.fromJson(p0);
        });
        return Right(responseObj.data!);
      },
    );
  }

  @override
  Future<Either<Exception, TokenModel>> signIn(String email, String otp) async {
    final response = await client.post(
      ApiConstants.signIn,
      data: {
        'user_email': email,
        'user_otp': otp,
      },
    );
    return response.fold(
      (error) => Left(error),
      (data) {
        final responseObj = ApiResponse<TokenModel>.fromJson(data, (p0) {
          return TokenModel.fromJson(p0);
        });
        return Right(responseObj.data!);
      },
    );
  }

  @override
  Future<Either<Exception, OtpModel>> sendOtp(String email) async {
    final response = await client.post(
      ApiConstants.sendOtp,
      data: {
        'user_email': email,
      },
    );
    return response.fold((error) => Left(error), (data) {
      final responseObj = ApiResponse<OtpModel>.fromJson(data, (p0) {
        return OtpModel.fromJson(p0);
      });
      return Right(responseObj.data!);
    });
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
