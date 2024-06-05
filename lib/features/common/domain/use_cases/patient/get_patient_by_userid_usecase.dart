import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';
import 'package:reservasi_rawat_jalan_mobile/core/usecase/usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/domain/entities/patient_entity.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/domain/repositories/patient_repository.dart';

class GetPatientByUserIdUseCase
    implements UseCase<List<PatientEntity>, String> {
  final PatientRepository _patientRepository = locator<PatientRepository>();

  @override
  Future<Either<Exception, List<PatientEntity>>> call(String params) async {
    return await _patientRepository.getPatientByUserId(params);
  }
}
