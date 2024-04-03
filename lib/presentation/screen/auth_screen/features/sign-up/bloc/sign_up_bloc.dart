import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:reservasi_rawat_jalan_mobile/domain/usecases/auth/sign_up_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase _signUpUseCase = locator<SignUpUseCase>();

  SignUpBloc() : super(SignUpInitial()) {
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
