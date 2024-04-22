import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';
import 'package:reservasi_rawat_jalan_mobile/core/usecase/usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/models/user_db_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/repositories/user_repository.dart';

class SaveUserUseCase implements UseCase<void, UserDbModel> {
  final UserRepository _userRepository = locator<UserRepository>();

  @override
  Future<Either<Exception, void>> call(UserDbModel params) async {
    return await _userRepository.saveUser(params);
  }
}


