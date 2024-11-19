import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/data_sources/doctor_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/models/doctor_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/repositories/doctor_repository.dart';

class DoctorRepositoryImpl implements DoctorRepository {
  final DoctorDatasource _doctorDatasource;

  DoctorRepositoryImpl(this._doctorDatasource);

  @override
  Future<Either<Exception, List<DoctorModel>>> getAvailableDoctorsByClinicAndDate(
      String clinicId, DateTime date) async {
    return await _doctorDatasource.getAvailableDoctorsByClinicAndDate(clinicId, date);
  }
}
