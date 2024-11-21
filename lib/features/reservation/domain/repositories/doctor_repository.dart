import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/domain/entities/doctor_entity.dart';

abstract class DoctorRepository {
  Future<Either<Exception, List<DoctorEntity>>> getAvailableDoctorsByClinicAndDate(String clinicId, DateTime date);
}
