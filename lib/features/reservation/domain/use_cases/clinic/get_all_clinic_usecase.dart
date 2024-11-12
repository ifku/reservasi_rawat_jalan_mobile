import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/usecase/usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/entities/clinic_entity.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/repositories/clinic_repository.dart';

class GetAllClinicUseCase implements UseCase<List<ClinicEntity>, void> {
  final ClinicRepository _clinicRepository;

  GetAllClinicUseCase(this._clinicRepository);

  @override
  Future<Either<Exception, List<ClinicEntity>>> call(void params) async {
    return await _clinicRepository.getAllClinic();
  }
}
