import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
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

  UserModel({
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
  }) : super(
          idUser: idUser,
          userName: userName,
          userFullName: userFullName,
          userNik: userNik,
          userEmail: userEmail,
          userPhone: userPhone,
          userAddress: userAddress,
          userGender: userGender,
          userDateOfBirth: userDateOfBirth,
          isCompleteProfile: isCompleteProfile,
          refreshToken: refreshToken,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        idUser: json["id_user"],
        userName: json["user_name"],
        userFullName: json["user_fullname"],
        userNik: json["user_nik"],
        userEmail: json["user_email"],
        userPhone: json["user_phone"],
        userAddress: json["user_address"],
        userGender: json["user_gender"],
        userDateOfBirth: DateTime.parse(json["user_date_of_birth"]),
        isCompleteProfile: json["is_complete_profile"],
        refreshToken: json["refresh_token"] ?? "",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id_user": idUser,
        "user_name": userName,
        "user_fullname": userFullName,
        "user_nik": userNik,
        "user_email": userEmail,
        "user_phone": userPhone,
        "user_address": userAddress,
        "user_gender": userGender,
        "user_date_of_birth": userDateOfBirth.toIso8601String(),
        "is_complete_profile": isCompleteProfile,
        "refresh_token": refreshToken,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
