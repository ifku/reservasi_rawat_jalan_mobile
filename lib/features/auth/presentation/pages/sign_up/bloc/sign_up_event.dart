part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();
}

class SignUp extends SignUpEvent {
  final String email;
  final String nik;

  const SignUp({required this.email, required this.nik});

  @override
  List<Object> get props => [email, nik];
}
