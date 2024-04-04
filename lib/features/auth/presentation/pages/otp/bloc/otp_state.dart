part of 'otp_bloc.dart';

sealed class OtpState extends Equatable {
  const OtpState();
}

final class OtpInitial extends OtpState {
  @override
  List<Object> get props => [];
}

final class VerifyOtpLoading extends OtpState {
  @override
  List<Object> get props => [];
}

final class VerifyOtpSuccess extends OtpState {
  @override
  List<Object> get props => [];
}

final class VerifyOtpFailure extends OtpState {
  final String error;

  const VerifyOtpFailure({required this.error});

  @override
  List<Object> get props => [error];
}
