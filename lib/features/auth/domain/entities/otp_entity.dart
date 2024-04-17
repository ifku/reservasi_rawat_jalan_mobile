import 'package:equatable/equatable.dart';

class OtpEntity extends Equatable {
  final int otp;
  final int expirationTime;

  const OtpEntity({
    required this.otp,
    required this.expirationTime,
  });


  @override
  List<Object> get props => [otp, expirationTime];
}