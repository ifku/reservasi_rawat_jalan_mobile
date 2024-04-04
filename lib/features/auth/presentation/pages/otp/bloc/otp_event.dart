part of 'otp_bloc.dart';

sealed class OtpEvent extends Equatable {
  const OtpEvent();
}

class ValidateOtp extends OtpEvent {
  final String email;
  final String otp;

  const ValidateOtp({required this.email, required this.otp});

  @override
  List<Object> get props => [email, otp];
}
