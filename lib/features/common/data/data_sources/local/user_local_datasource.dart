import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/data/data_sources/user_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/data/models/user_db_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/data/models/user_model.dart';


class UserLocalDataSource implements UserDataSource {
  final Isar _isar = GetIt.instance.get<Isar>();

  @override
  Future<Either<Exception, UserModel>> completeProfile(String email) {
    // TODO: implement completeProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, UserDbModel>> getUser() async {
    try {
      final user = await _isar.userDbModels.where().findFirst();
      return Right(user!);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, UserDbModel>> saveUser(UserDbModel user) async {
    try {
      final userData = await _isar.writeTxn(() async {
        await _isar.userDbModels.put(user);
      });
      return right(userData);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, UserDbModel>> updateUser(UserDbModel user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, bool>> deleteUser() async {
    try {
      await _isar.writeTxn(() async {
        await _isar.userDbModels.clear();
      });
      return right(true);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
