import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';
import 'package:reservasi_rawat_jalan_mobile/data/model/doctor_model.dart';
import 'package:reservasi_rawat_jalan_mobile/domain/repository/doctor_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/domain/usecases/usecase.dart';

class GetDoctorByClinicIdUseCase implements UseCase<List<DoctorModel>, String> {
  final DoctorRepository doctorRepository = locator<DoctorRepository>();

  @override
  Future<Either<Exception, List<DoctorModel>>> call(String params) async {
    return await doctorRepository.getDoctorById(params);
  }
}
