import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/data_sources/doctor_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/models/doctor_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/repositories/doctor_repository.dart';

class DoctorRepositoryImpl implements DoctorRepository {
  final DoctorDatasource doctorDatasource = locator<DoctorDatasource>();

  @override
  Future<Either<Exception, List<DoctorModel>>> getDoctorById(String id) async {
    return await doctorDatasource.getDoctorById(id);
  }
}
