import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/entities/doctor_entity.dart';

abstract class DoctorRepository {
  Future<Either<Exception, List<DoctorEntity>>> getDoctorByClinicId(String id);
}
