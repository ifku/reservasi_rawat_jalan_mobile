import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/models/user_db_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/entities/sign_in_entity.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/entities/token_entity.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/entities/user_entity.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/use_cases/save_token_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/use_cases/save_user_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/use_cases/sign_in_usecase.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final SignInUseCase _signInUseCase = locator<SignInUseCase>();
  final SaveUserUseCase _saveUserUseCase = locator<SaveUserUseCase>();
  final SaveTokenUseCase _saveTokenUseCase = locator<SaveTokenUseCase>();

  OtpBloc() : super(OtpInitial()) {
    on<ValidateOtp>((event, emit) async {
      emit(VerifyOtpLoading());
      try {
        final result = await _signInUseCase.call(Tuple2(event.email, event.otp));
        result.fold(
              (l) => emit(VerifyOtpFailure(error: l.toString())),
              (r) {
            final userDbModel = _mapUserEntityToDbModel(r.user);
            _saveUserUseCase.call(userDbModel);

            final tokenEntity = _createTokenEntity(r);
            _saveTokenUseCase.call(tokenEntity);

            emit(r.user.isCompleteProfile
                ? VerifyOtpSuccess()
                : UserProfileIncomplete());
          },
        );
      } catch (e) {
        emit(VerifyOtpFailure(error: e.toString()));
      }
    });


  }
}

TokenEntity _createTokenEntity(SignInEntity user) {
  return TokenEntity(
    accessToken: user.accessToken,
    tokenType: user.tokenType,
    expiresIn: user.expiresIn,
  );
}

UserDbModel _mapUserEntityToDbModel(UserEntity userEntity) {
  return UserDbModel(
    idUser: userEntity.idUser,
    userName: userEntity.userName,
    userFullName: userEntity.userFullName,
    userNik: userEntity.userNik,
    userEmail: userEntity.userEmail,
    userPhone: userEntity.userPhone,
    userAddress: userEntity.userAddress,
    userGender: userEntity.userGender,
    userDateOfBirth: userEntity.userDateOfBirth,
    isCompleteProfile: userEntity.isCompleteProfile,
    refreshToken: userEntity.refreshToken,
    createdAt: userEntity.createdAt,
    updatedAt: userEntity.updatedAt,
  );
}
