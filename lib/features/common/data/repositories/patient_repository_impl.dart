import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/data/data_sources/patient_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/domain/entities/patient_entity.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/domain/repositories/patient_repository.dart';

class PatientRepositoryImpl implements PatientRepository {
  final PatientDataSource _patientDataSource;

  PatientRepositoryImpl(this._patientDataSource);

  @override
  Future<Either<Exception, List<PatientEntity>>> getPatientByUserId(
      String userId) async {
    return await _patientDataSource.getPatientByUserId(userId);
  }
}
