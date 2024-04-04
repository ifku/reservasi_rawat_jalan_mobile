part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {
  const SignInEvent();
}

class SignIn extends SignInEvent {
  final String email;

  const SignIn({required this.email});

  @override
  List<Object> get props => [email];
}
