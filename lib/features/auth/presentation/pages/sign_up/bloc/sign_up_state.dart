part of 'sign_up_bloc.dart';

sealed class SignUpState extends Equatable {
  const SignUpState();
}

final class SignUpInitial extends SignUpState {
  @override
  List<Object> get props => [];
}

final class SignUpLoading extends SignUpState {
  @override
  List<Object> get props => [];
}

final class SignUpSuccess extends SignUpState {
  @override
  List<Object> get props => [];
}

final class SignUpFailure extends SignUpState {
  final String error;

  const SignUpFailure({required this.error});

  @override
  List<Object> get props => [error];
}
