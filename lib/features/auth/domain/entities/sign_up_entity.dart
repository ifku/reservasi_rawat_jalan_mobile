import 'package:equatable/equatable.dart';

class SignUpEntity extends Equatable {
  final UserRegisterEntity user;
  final int otp;
  final int expirationTime;

  const SignUpEntity({
    required this.user,
    required this.otp,
    required this.expirationTime,
  });

  @override
  List<Object?> get props => [];
}

class UserRegisterEntity extends Equatable {
  final String idUser;
  final String userEmail;
  final String userNik;
  final DateTime updatedAt;
  final DateTime createdAt;

  const UserRegisterEntity({
    required this.idUser,
    required this.userEmail,
    required this.userNik,
    required this.updatedAt,
    required this.createdAt,
  });

  @override
  List<Object> get props => [];
}
