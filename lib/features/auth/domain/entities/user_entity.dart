import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String idUser;
  final String userName;
  final String userFullName;
  final String userNik;
  final String userEmail;
  final String userPhone;
  final String userAddress;
  final String userGender;
  final DateTime userDateOfBirth;
  final bool isCompleteProfile;
  final String refreshToken;
  final DateTime createdAt;
  final DateTime updatedAt;

  const UserEntity({
    required this.idUser,
    required this.userName,
    required this.userFullName,
    required this.userNik,
    required this.userEmail,
    required this.userPhone,
    required this.userAddress,
    required this.userGender,
    required this.userDateOfBirth,
    required this.isCompleteProfile,
    required this.refreshToken,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object> get props => [
        idUser,
        userName,
        userFullName,
        userNik,
        userEmail,
        userPhone,
        userAddress,
        userGender,
      ];
}
