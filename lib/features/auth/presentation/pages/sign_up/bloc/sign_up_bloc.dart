import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/use_cases/sign_up_usecase.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase _signUpUseCase;

  SignUpBloc(this._signUpUseCase) : super(SignUpInitial()) {
    on<SignUp>((event, emit) async {
      emit(SignUpLoading());
      try {
        final result =
            await _signUpUseCase.call(Tuple2(event.email, event.nik));
        result.fold(
          (l) => emit(SignUpFailure(error: l.toString())),
          (r) => emit(SignUpSuccess()),
        );
      } catch (e) {
        emit(SignUpFailure(error: e.toString()));
      }
    });
  }
}
