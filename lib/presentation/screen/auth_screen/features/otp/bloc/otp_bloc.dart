import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:reservasi_rawat_jalan_mobile/domain/usecases/auth/sign_in_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';

part 'otp_event.dart';

part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final SignInUseCase _signInUseCase = locator<SignInUseCase>();

  OtpBloc() : super(OtpInitial()) {
    on<ValidateOtp>((event, emit) async {
      emit(VerifyOtpLoading());
      try {
        final result =
            await _signInUseCase.call(Tuple2(event.email, event.otp));
        result.fold(
          (l) => emit(VerifyOtpFailure(error: l.toString())),
          (r) => emit(VerifyOtpSuccess()),
        );
      } catch (e) {
        emit(VerifyOtpFailure(error: e.toString()));
      }
    });
  }
}
