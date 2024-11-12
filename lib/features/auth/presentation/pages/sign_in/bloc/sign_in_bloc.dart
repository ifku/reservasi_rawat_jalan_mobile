import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/use_cases/send_otp_usecase.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SendOtpUseCase _sendOtpUseCase;

  SignInBloc(this._sendOtpUseCase) : super(SignInInitial()) {
    on<SignIn>((event, emit) async {
      emit(SignInLoading());
      try {
        final result = await _sendOtpUseCase.call(event.email);
        result.fold(
          (l) => emit(SignInFailure(error: l.toString())),
          (r) => emit(SignInSuccess()),
        );
      } catch (e) {
        emit(SignInFailure(error: e.toString()));
      }
    });
  }
}
