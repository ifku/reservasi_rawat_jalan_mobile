import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/data_sources/user_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/models/user_db_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/models/user_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource = locator<UserDataSource>();

  @override
  Future<Either<Exception, UserModel>> completeProfile(String email) {
    // TODO: implement completeProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, UserDbModel>> getUser() async {
    return await _userDataSource.getUser();
  }

  @override
  Future<Either<Exception, UserDbModel>> saveUser(UserDbModel user) async {
    return await _userDataSource.saveUser(user);
  }

  @override
  Future<Either<Exception, UserDbModel>> updateUser(UserDbModel user) async {
    return await _userDataSource.updateUser(user);
  }

  @override
  Future<Either<Exception, bool>> deleteUser() async {
    return await _userDataSource.deleteUser();
  }
}
