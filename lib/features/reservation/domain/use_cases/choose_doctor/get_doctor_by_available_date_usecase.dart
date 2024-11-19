import 'package:dartz/dartz.dart';
import 'package:dartz/dartz.dart' show Tuple2;
import 'package:reservasi_rawat_jalan_mobile/core/usecase/usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/entities/doctor_entity.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/repositories/doctor_repository.dart';

class GetDoctorByClinicIdUseCase
    implements UseCase<List<DoctorEntity>, Tuple2<String, DateTime>> {
  final DoctorRepository _doctorRepository;

  GetDoctorByClinicIdUseCase(this._doctorRepository);

  @override
  Future<Either<Exception, List<DoctorEntity>>> call(
      Tuple2<String, DateTime> params) async {
    final clinicId = params.value1; // First parameter (clinicId)
    final date = params.value2; // Second parameter (date)

    return await _doctorRepository.getAvailableDoctorsByClinicAndDate(clinicId, date
    );
  }
}
