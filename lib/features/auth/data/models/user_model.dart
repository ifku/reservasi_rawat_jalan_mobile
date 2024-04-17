import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.idUser,
    required super.userName,
    required super.userFullName,
    required super.userNik,
    required super.userEmail,
    required super.userPhone,
    required super.userAddress,
    required super.userGender,
    required super.userDateOfBirth,
    required super.isCompleteProfile,
    required super.refreshToken,
    required super.createdAt,
    required super.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        idUser: json["id_user"],
        userName: json["user_name"] ?? "",
        userFullName: json["user_fullname"] ?? "",
        userNik: json["user_nik"],
        userEmail: json["user_email"] ?? "",
        userPhone: json["user_phone"] ?? "",
        userAddress: json["user_address"] ?? "",
        userGender: json["user_gender"],
        userDateOfBirth: json["user_date_of_birth"] != null
            ? DateTime.parse(json["user_date_of_birth"])
            : DateTime.now(),
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
        "user_date_of_birth": userDateOfBirth?.toIso8601String(),
        "is_complete_profile": isCompleteProfile,
        "refresh_token": refreshToken,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
