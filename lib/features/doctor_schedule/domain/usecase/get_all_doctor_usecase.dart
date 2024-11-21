import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/usecase/usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/domain/entities/doctor_entity.dart';
import 'package:reservasi_rawat_jalan_mobile/features/doctor_schedule/domain/repositories/doctor_list_repository.dart';

class GetAllDoctorUseCase implements UseCase<void, int> {
  final DoctorListRepository _doctorListRepository;

  GetAllDoctorUseCase(this._doctorListRepository);

  @override
  Future<Either<Exception, List<DoctorEntity>>> call(int params) async {
    return await _doctorListRepository.getAllDoctor(page: params);
  }
}
