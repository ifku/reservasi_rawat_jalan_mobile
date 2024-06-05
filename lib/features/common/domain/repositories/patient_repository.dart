import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/domain/entities/patient_entity.dart';

abstract class PatientRepository {
  Future<Either<Exception, List<PatientEntity>>> getPatientByUserId(
      String userId);
}
