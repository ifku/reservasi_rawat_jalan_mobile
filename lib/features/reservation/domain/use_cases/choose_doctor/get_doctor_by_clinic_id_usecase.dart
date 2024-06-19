import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';
import 'package:reservasi_rawat_jalan_mobile/core/usecase/usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/entities/doctor_entity.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/repositories/doctor_repository.dart';

class GetDoctorByClinicIdUseCase
    implements UseCase<List<DoctorEntity>, String> {
  final DoctorRepository doctorRepository = locator<DoctorRepository>();

  @override
  Future<Either<Exception, List<DoctorEntity>>> call(String params) async {
    return await doctorRepository.getDoctorByClinicId(params);
  }
}
