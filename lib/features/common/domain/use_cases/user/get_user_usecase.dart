import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/usecase/usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/domain/entities/user_entity.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/domain/repositories/user_repository.dart';

class GetUserUseCase implements UseCase<UserEntity, void> {
  final UserRepository _userRepository;
  GetUserUseCase(this._userRepository);
  @override
  Future<Either<Exception, UserEntity>> call(void params) async {
    return await _userRepository.getUser();
  }
}
