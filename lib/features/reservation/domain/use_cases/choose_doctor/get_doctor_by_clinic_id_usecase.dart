import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/models/doctor_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/repositories/doctor_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/core/usecase/usecase.dart';

class GetDoctorByClinicIdUseCase implements UseCase<List<DoctorModel>, String> {
  final DoctorRepository doctorRepository = locator<DoctorRepository>();

  @override
  Future<Either<Exception, List<DoctorModel>>> call(String params) async {
    return await doctorRepository.getDoctorById(params);
  }
}
