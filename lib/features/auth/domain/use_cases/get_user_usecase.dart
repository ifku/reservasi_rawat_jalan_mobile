import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';
import 'package:reservasi_rawat_jalan_mobile/core/usecase/usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/models/user_db_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/repositories/user_repository.dart';

class GetUserUseCase implements UseCase<UserDbModel, void> {
  final UserRepository _userRepository = locator<UserRepository>();

  @override
  Future<Either<Exception, UserDbModel>> call(void params) async {
    return await _userRepository.getUser();
  }
}
