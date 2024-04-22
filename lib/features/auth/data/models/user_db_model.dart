import 'package:isar/isar.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/entities/user_entity.dart';

part 'user_db_model.g.dart';

@Collection(ignore: {'props'})
class UserDbModel extends UserEntity {
  final Id id = Isar.autoIncrement;

  @override
  @Index(unique: true)
  String get idUser => super.idUser;

  const UserDbModel({
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

  @override
  List<Object?> get props => [];
}
